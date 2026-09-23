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
- **Vistas de parede (elevação):** selecione uma parede e toque em "Ver de frente", ou use o seletor de folhas no topo ("+ Nova vista de parede"). As peças encostadas na parede na planta aparecem de frente sozinhas, na altura certa, com cotas em cadeia embaixo e do lado. Aéreos, tomadas e nichos você coloca direto na vista.
- **Biblioteca com duas vistas:** cada peça tem desenho de cima e de frente (103 peças: cozinha, módulos planejados, dormitório, sala, banheiro, lavanderia, escritório, portas e janelas, pontos técnicos).
- **Barra rápida** sobre a seleção: duplicar, girar, espelhar, agrupar/desagrupar, salvar como peça e excluir.
- **Estúdio de peças:** desenhe suas peças em tamanho real, de cima e de frente (duas folhas), e salve em "Minhas peças". Também dá para selecionar objetos de um projeto e salvar como peça.
- **Exportar:** imagem PNG da folha (para o WhatsApp), PDF em escala da folha ou PDF com todas as folhas (planta e vistas).

## Importante: backup
Os desenhos ficam só no tablet. Use **Backup > Exportar todos** de vez em quando e guarde o arquivo no Drive.

## Atualizar o app
Use o `publicar.sh` (veja PUBLICAR.md). Ele sobe a versão no app e no cache offline, confere se o código não tem erro de sintaxe e envia para o GitHub:

    ESQUADRO_TOKEN=seu_token ./publicar.sh "o que mudou"

No tablet, feche e abra o app uma vez para pegar a versão nova.
