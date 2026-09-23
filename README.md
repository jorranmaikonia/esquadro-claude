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
- **Caneta desenha. Com o botão da S Pen apertado, a caneta seleciona e move** sem trocar de ferramenta.
- **Um dedo move a tela, dois dedos dão zoom.** Um toque de dedo num objeto seleciona. **Dois dedos tocando = desfazer; três = refazer.**
- **Toque de novo na ferramenta ativa para fixá-la** (ela não volta para Selecionar depois de cada desenho).
- **Traço livre:** segure a caneta parada no fim do traço e ele vira reta, retângulo, círculo ou triângulo.
- **Mais formas:** triângulos, losango, trapézio, polígonos, estrela, seta, cruz, L, U, meio círculo, quarto de círculo e arco. Todas editáveis ponto a ponto.
- **Parede:** toque ponto a ponto e toque no primeiro ponto para fechar o cômodo. Nome e área aparecem no centro.
- **Biblioteca (último botão da esquerda):** móveis, eletros, portas e janelas em tamanho real, por ambiente, com busca. Toque na peça e no desenho: perto de uma parede ela encosta e gira sozinha; porta e janela entram na parede e pegam a espessura dela.
- **Barra rápida** sobre a seleção: duplicar, girar, espelhar, agrupar/desagrupar, salvar como peça e excluir.
- **Estúdio de peças:** desenhe suas peças em tamanho real (a parte de cima é o fundo, o lado da parede) e salve em "Minhas peças". Também dá para selecionar objetos de um projeto e salvar como peça.
- **Exportar:** imagem PNG (para o WhatsApp) ou PDF em escala (1:20, 1:25, 1:50...).

## Importante: backup
Os desenhos ficam só no tablet. Use **Backup > Exportar todos** de vez em quando e guarde o arquivo no Drive.

## Atualizar o app
Use o `publicar.sh` (veja PUBLICAR.md). Ele sobe a versão no app e no cache offline, confere se o código não tem erro de sintaxe e envia para o GitHub:

    ESQUADRO_TOKEN=seu_token ./publicar.sh "o que mudou"

No tablet, feche e abra o app uma vez para pegar a versão nova.
