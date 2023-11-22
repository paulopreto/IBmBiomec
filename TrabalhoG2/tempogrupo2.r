#Instalando a livraria utilizadas
install.packages('ggplot2')
library('ggplot2')

#Definindo o caminho para o arquivo
setwd('C:/Users/danif/OneDrive/Documents/Biomec')

#Lendo os dados do arquivo dos ponteiros
dadospoint = read.csv('Sit_five02_PointDataChannels.csv')

#Criando uma variável que irá representar cada captura dos pontos
variavel_contagem <- seq(1, 1745)

soma <- dadospoint$head.........................._X + dadospoint$head.........................._Y + dadospoint$head.........................._Z

#Gerando gráfico de tempo percorrido entre sentar e levantar
ggplot(dadospoint, aes(x = variavel_contagem, y = soma)) +
  geom_line(color = "black", size = 1) +
  geom_point(data = dadospoint, aes(x = 260, y = 1700, color = "Terminando de levantar"), size = 3, shape = 1) +
  geom_point(data = dadospoint, aes(x = 310, y = 1700, color = "Começando a sentar"), size = 3, shape = 8) +
  labs(title = "Tempo das cinco repetições de sentar e levantar", x = "Tempo (em milésimos)", y = "Altura (em centímetros)") +
  scale_color_manual(values = c("Terminando de levantar" = "red", "Começando a sentar" = "darkblue")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 12),
    axis.line = element_line(color = "black", size = 0.5),
    panel.grid.major = element_line(color = "gray", linetype = "dashed", size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white"),
    legend.position = "bottom",  # Ajusta a posição da legenda
    legend.title = element_blank()  # Remove o título da legenda
  )
