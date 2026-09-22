#!/usr/bin/env bash
# publicar.sh — publica o Esquadro no GitHub Pages
#
# Uso:
#   ESQUADRO_TOKEN=xxxx ./publicar.sh "o que mudou"              # sobe a versão (1.0.0 -> 1.0.1) e publica
#   ESQUADRO_TOKEN=xxxx ./publicar.sh "o que mudou" --sem-versao # publica sem mudar a versão
#
# O token nunca é gravado em disco nem no .git/config: vai só no cabeçalho da requisição.
set -euo pipefail

REPO="${ESQUADRO_REPO:-jorranmaikonia/esquadro-claude}"
RAMO="main"
MSG="${1:-Atualização do Esquadro}"
SEM_VERSAO="${2:-}"
cd "$(dirname "$0")"

falha() { echo "ERRO: $*" >&2; exit 1; }
# (usa ESQUADRO_TOKEN de propósito: GH_TOKEN pode já existir no ambiente com outra finalidade)
[ -n "${ESQUADRO_TOKEN:-}" ] || falha "defina ESQUADRO_TOKEN com o token do GitHub (só permissão Contents no repositório $REPO)."
[ -f index.html ] && [ -f sw.js ] || falha "rode dentro da pasta do app."

# 1. sobe a versão (patch) no app e no cache offline, para o tablet baixar a nova versão
ATUAL=$(grep -oP "const VERSAO = '\K[0-9]+\.[0-9]+\.[0-9]+" index.html)
# só sobe a versão se há mudança nova (numa nova tentativa de envio, não sobe de novo)
MUDOU=1
if [ -d .git ] && git rev-parse -q --verify HEAD >/dev/null && [ -z "$(git status --porcelain)" ]; then MUDOU=0; fi
if [ "$SEM_VERSAO" != "--sem-versao" ] && [ "$MUDOU" = 1 ]; then
  IFS=. read -r MA MI PA <<<"$ATUAL"
  NOVA="$MA.$MI.$((PA + 1))"
  sed -i "s/const VERSAO = '$ATUAL'/const VERSAO = '$NOVA'/" index.html
  sed -i "s/const CACHE = 'esquadro-v[0-9.]*'/const CACHE = 'esquadro-v$NOVA'/" sw.js
else
  NOVA="$ATUAL"
fi

# 2. valida o JavaScript antes de publicar (um erro aqui quebraria o app no tablet)
TMPJS=$(mktemp --suffix=.js)
python3 - "$TMPJS" <<'PY'
import re, sys
s = open('index.html', encoding='utf-8').read()
m = re.search(r'<script>(.*)</script>', s, re.S)
open(sys.argv[1], 'w', encoding='utf-8').write(m.group(1))
PY
node --check "$TMPJS" || { rm -f "$TMPJS"; falha "o JavaScript do index.html tem erro de sintaxe. Nada foi publicado."; }
node --check sw.js || falha "o sw.js tem erro de sintaxe. Nada foi publicado."
rm -f "$TMPJS"

# 3. commit
[ -d .git ] || { git init -q -b "$RAMO"; }
git config user.name  >/dev/null || git config user.name  "Jorran Ribeiro"
git config user.email >/dev/null || git config user.email "jorranmaikonia@users.noreply.github.com"
git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$REPO.git"
git add -A
if git diff --cached --quiet; then
  echo "Nada mudou desde a última publicação."
else
  git commit -q -F - <<EOF
v$NOVA: $MSG

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_0129majFZbqEsgRcNmmx2Fhm
EOF
fi

# 4. push com o token só no cabeçalho
AUTH=$(printf 'x-access-token:%s' "$ESQUADRO_TOKEN" | base64 -w0)
if ! git -c credential.helper= -c http.extraheader="Authorization: Basic $AUTH" push -q origin "HEAD:$RAMO"; then
  # desfaz o commit e a troca de versão, mantendo as mudanças, para a próxima tentativa sair limpa
  if [ "$NOVA" != "$ATUAL" ] && git log -1 --format=%s | grep -q "^v$NOVA:"; then
    if git rev-parse -q --verify HEAD~1 >/dev/null; then git reset -q HEAD~1; else git update-ref -d HEAD; git rm -r -q --cached .; fi
    sed -i "s/const VERSAO = '$NOVA'/const VERSAO = '$ATUAL'/" index.html
    sed -i "s/const CACHE = 'esquadro-v$NOVA'/const CACHE = 'esquadro-v$ATUAL'/" sw.js
  fi
  falha "o GitHub recusou o envio. Confira se o repositório $REPO existe e se o token tem Contents: Read and write nele."
fi

DONO=${REPO%%/*}; NOME=${REPO##*/}
echo "Publicado v$NOVA. Em 1 a 2 minutos: https://${DONO,,}.github.io/$NOME/"
