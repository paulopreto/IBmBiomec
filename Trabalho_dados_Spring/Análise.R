#-------------------------------------------------------------------------------
#Analisando os dados de Movimento
#Os dados devem ser importados pelo recurso "Import Dataset"

library(ggplot2)
library(reshape2)
library(dplyr)
library (readr)

#FAZENDO A ANALISE NO EIXO X
dados <- Spring01_PointDataChannels %>%
  select(rShoulder_X, lShoulder_X)

dados$linha <- seq_along(dados[,1])
dados_melted <- melt(dados, id.vars = "linha")

ggplot(dados_melted, aes(x = linha, y = value, color = variable)) +
  geom_line() +
  labs(title = "Variação de rShoulder_X e lShoulder_X ao longo do tempo",
       x = "Tempo",
       y = "rShoulder_X e lShoulder_X")


dados1 <- Spring01_PointDataChannels %>%
  select(rHip_X, lHip_X)

dados1$linha <- seq_along(dados1[,1])
dados_melted <- melt(dados1, id.vars = "linha")

ggplot(dados_melted, aes(x = linha, y = value, color = variable)) +
  geom_line() +
  labs(title = "Variação de rHip_X e lHip_X ao longo do tempo",
       x = "Tempo",
       y = "rHip_X e lHip_X")



#FAZENDO A ANALISE NO EIXO Y
dados <- Spring01_PointDataChannels %>%
  select(rShoulder_Y, lShoulder_Y)

dados$linha <- seq_along(dados[,1])
dados_melted <- melt(dados, id.vars = "linha")

ggplot(dados_melted, aes(x = linha, y = value, color = variable)) +
  geom_line() +
  labs(title = "Variação de rShoulder_Y e lShoulder_Y ao longo do tempo",
       x = "Tempo",
       y = "rShoulder_Y e lShoulder_Y")


dados1 <- Spring01_PointDataChannels %>%
  select(rHip_Y, lHip_Y)

dados1$linha <- seq_along(dados1[,1])
dados_melted <- melt(dados1, id.vars = "linha")

ggplot(dados_melted, aes(x = linha, y = value, color = variable)) +
  geom_line() +
  labs(title = "Variação de rHip_Y e lHip_Y ao longo do tempo",
       x = "Tempo",
       y = "rHip_Y e lHip_Y")



#FAZENDO A ANALISE NO EIXO Z
dados <- Spring01_PointDataChannels %>%
  select(rShoulder_Z, lShoulder_Z)

dados$linha <- seq_along(dados[,1])
dados_melted <- melt(dados, id.vars = "linha")

ggplot(dados_melted, aes(x = linha, y = value, color = variable)) +
  geom_line() +
  labs(title = "Variação de rShoulder_Z e lShoulder_Z ao longo do tempo",
       x = "Tempo",
       y = "rShoulder_Z e lShoulder_Z")


dados1 <- Spring01_PointDataChannels %>%
  select(rHip_Y, lHip_Y)

dados1$linha <- seq_along(dados1[,1])
dados_melted <- melt(dados1, id.vars = "linha")

ggplot(dados_melted, aes(x = linha, y = value, color = variable)) +
  geom_line() +
  labs(title = "Variação de rHip_Z e lHip_Z ao longo do tempo",
       x = "Tempo",
       y = "rHip_Z e lHip_Z")


#-------------------------------------------------------------------------------
#Analisando os dados de Força
#Os dados devem ser importados pelo recurso "Import Dataset"

# install.packages("ggplot2")
library(ggplot2)
library(dplyr)
library(readr)

dadosAnalog <- Spring01_AnalogDataChannels
novo_nome <- as.character(dadosAnalog[1, ])
dadosAnalog <- dadosAnalog[-1, ]
names(dadosAnalog) <- novo_nome
print(dadosAnalog)

dadosAnalog$Force.Fx1 <- as.numeric(dadosAnalog$Force.Fx1)
dadosAnalog$Force.Fx2 <- as.numeric(dadosAnalog$Force.Fx2)

grafico_Fx1 <- ggplot(dadosAnalog, aes(x = 1:nrow(dadosAnalog), y = Force.Fx1)) +
  geom_line(color = "red") +
  labs(x = "Tempo", y = "Force.Fx1") +
  ggtitle("Variação de Force.Fx1 ao longo do tempo")

grafico_Fx2 <- ggplot(dadosAnalog, aes(x = 1:nrow(dadosAnalog), y = Force.Fx2)) +
  geom_line(color = "navy") +
  labs(x = "Tempo", y = "Force.Fx2") +
  ggtitle("Variação de Force.Fx2 ao longo do tempo")

print(grafico_Fx1)
print(grafico_Fx2)



dadosAnalog$Force.Fy1 <- as.numeric(dadosAnalog$Force.Fy1)
dadosAnalog$Force.Fy2 <- as.numeric(dadosAnalog$Force.Fy2)

grafico_Fy1 <- ggplot(dadosAnalog, aes(x = 1:nrow(dadosAnalog), y = Force.Fy1)) +
  geom_line(color = "red") +
  labs(x = "Tempo", y = "Force.Fy1") +
  ggtitle("Variação de Force.Fy1 ao longo do tempo")

grafico_Fy2 <- ggplot(dadosAnalog, aes(x = 1:nrow(dadosAnalog), y = Force.Fy2)) +
  geom_line(color = "navy") +
  labs(x = "Tempo", y = "Force.Fy2") +
  ggtitle("Variação de Force.Fy2 ao longo do tempo")

print(grafico_Fy1)
print(grafico_Fy2)




dadosAnalog$Force.Fz1 <- as.numeric(dadosAnalog$Force.Fz1)
dadosAnalog$Force.Fz2 <- as.numeric(dadosAnalog$Force.Fz2)

grafico_Fz1 <- ggplot(dadosAnalog, aes(x = 1:nrow(dadosAnalog), y = Force.Fx1)) +
  geom_line(color = "red") +
  labs(x = "Tempo", y = "Force.Fz1") +
  ggtitle("Variação de Force.Fz1 ao longo do tempo")

grafico_Fz2 <- ggplot(dadosAnalog, aes(x = 1:nrow(dadosAnalog), y = Force.Fx2)) +
  geom_line(color = "navy") +
  labs(x = "Tempo", y = "Force.Fz2") +
  ggtitle("Variação de Force.Fz2 ao longo do tempo")

print(grafico_Fz1)
print(grafico_Fz2)
