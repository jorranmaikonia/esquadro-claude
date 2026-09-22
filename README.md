# Esquadro — levantamento para móveis planejados

App para medir ambientes na casa do cliente com o tablet e a S Pen. Funciona sem internet depois de instalado.

## Publicar no GitHub Pages (uma vez)
1. Crie um repositório novo no GitHub, por exemplo `esquadro`.
2. Envie todos os arquivos desta pasta para a raiz do repositório (index.html, sw.js, manifest.webmanifest e os 3 ícones).
3. No repositório: Settings > Pages > Source: "Deploy from a branch", branch `main`, pasta `/ (root)`. Salve.
4. Em 1 a 2 minutos o endereço fica pronto: `https://SEU-USUARIO.github.io/esquadro/`

## Instalar no Galaxy Tab S10
1. Abra o endereço no Chrome do tablet.
2. Menu (⋮) > "Adicionar à tela inicial" > Instalar.
3. Abra pelo ícone. A partir daí funciona offline.

## Uso rápido
- **Caneta desenha, dedo move e dá zoom** (dois dedos = zoom). Botão lateral da S Pen também move a tela.
- Desenhe o contorno do cômodo; termine perto do primeiro canto para fechar.
- Toque na parede para digitar as 3 medidas (embaixo, meio, em cima). O app usa a menor.
- Toque no canto para conferir o esquadro pelo método 3-4-5 (60, 80 e diagonal de 100 cm).
- Aba Vistas: toque na parede para marcar tomada, janela, cano etc.
- Aba Resumo: alertas e o botão do PDF técnico (imprimir > Salvar como PDF).

## Importante: backup
Os dados ficam só no tablet. Use **Backup > Exportar** no fim de cada visita e guarde o arquivo no Drive.

## Atualizar o app
Use o `publicar.sh` (veja PUBLICAR.md). Ele sobe a versão no app e no cache offline, confere se o código não tem erro de sintaxe e envia para o GitHub:

    ESQUADRO_TOKEN=seu_token ./publicar.sh "o que mudou"

No tablet, feche e abra o app uma vez para pegar a versão nova.
