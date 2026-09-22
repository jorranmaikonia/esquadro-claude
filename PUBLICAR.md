# Publicação automática do Esquadro

O GitHub já tem a API; o que falta é uma chave (token) com permissão só para o repositório do app.
Com ela, o Claude roda `publicar.sh` e o app atualiza no GitHub Pages sem você copiar arquivo nenhum.

## Uma vez só (5 minutos)

### 1. Criar o repositório
- Acesse github.com/new
- Nome: `esquadro-claude`
- Visibilidade: **Public** (o GitHub Pages grátis exige repositório público)
- **Não** marque "Add a README". Crie vazio.

### 2. Criar o token (chave de acesso)
- Acesse github.com/settings/personal-access-tokens/new (tipo *Fine-grained*)
- Token name: `esquadro-claude`
- Expiration: 30 dias (renove quando vencer)
- Repository access: **Only select repositories** → `esquadro-claude`
- Permissions > Repository permissions > **Contents: Read and write** (só isso; "Metadata: Read" entra sozinho)
- Gere e copie o token (começa com `github_pat_`).

### 3. Mandar para o Claude
Cole o token no chat quando pedir uma publicação. Ele não fica salvo: o espaço de trabalho do Claude é apagado quando a sessão para, então numa sessão nova você cola de novo.

### 4. Ligar o GitHub Pages (depois do primeiro envio)
- No repositório: Settings > Pages
- Source: "Deploy from a branch", branch `main`, pasta `/ (root)` > Save
- Isso é manual: pela API, token fine-grained recebe erro 403 nessa configuração.

Endereço do app: https://jorranmaikonia.github.io/esquadro-claude/

## Segurança
- O token só mexe nos arquivos do repositório `esquadro-claude`. Não acessa seus outros repositórios nem sua conta.
- Se colar o token em lugar errado, revogue na hora: github.com/settings/personal-access-tokens > Revoke.
- O script nunca grava o token em disco nem no `.git/config`.
