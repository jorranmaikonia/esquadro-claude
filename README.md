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
- **Caneta desenha, dedo move a tela, dois dedos dão zoom.** Segurando o botão da S Pen, a caneta também move a tela.
- **Parede:** toque ponto a ponto (ou arraste cada trecho). Toque no primeiro ponto (amarelo) para fechar o cômodo e dê o nome no painel. A área aparece sozinha.
- **Comprimento exato:** enquanto desenha, digite o comprimento na barra de baixo e toque em Aplicar. Depois, dá para mudar cada trecho no painel.
- **Móveis:** Retângulo e Elipse. Arraste de um canto ao outro, ou toque uma vez para criar uma peça de 60 × 60 cm. Largura, profundidade e ângulo podem ser digitados no painel.
- **Editar:** com Selecionar, os quadradinhos mudam o tamanho, a bolinha amarela gira e a bolinha preta no meio de um trecho faz curva (um toque nela cria um ponto). Toque duas vezes num ponto para apagá-lo.
- **Cores por categoria:** Parede, Móvel, Porta/janela, Eletro, Elétrica, Hidráulica, Observação e Medida. Além disso, qualquer cor, preenchimento, transparência, espessura e tipo de linha.
- **Grade, Ímã e 90°** ficam na barra de cima.
- **Exportar:** imagem PNG (para o WhatsApp) ou PDF em escala (1:20, 1:25, 1:50...).

## Importante: backup
Os desenhos ficam só no tablet. Use **Backup > Exportar todos** de vez em quando e guarde o arquivo no Drive.

## Atualizar o app
Use o `publicar.sh` (veja PUBLICAR.md). Ele sobe a versão no app e no cache offline, confere se o código não tem erro de sintaxe e envia para o GitHub:

    ESQUADRO_TOKEN=seu_token ./publicar.sh "o que mudou"

No tablet, feche e abra o app uma vez para pegar a versão nova.
