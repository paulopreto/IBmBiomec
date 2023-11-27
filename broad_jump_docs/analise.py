import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Leitura dos arquivos CSV
arquivo_csv_analog = "/Users/lembor/Desktop/biomec_final/Broad_jump03_AnalogDataChannels.csv"
arquivo_csv_point = "/Users/lembor/Desktop/biomec_final/Broad_jump03_PointDataChannels.csv"

# Leitura dos dados do arquivo AnalogData
dados_analog = pd.read_csv(arquivo_csv_analog)
dados_analog.columns = dados_analog.columns.str.strip().str.replace(' ', '')

# Leitura dos dados do arquivo PointData
dados_point = pd.read_csv(arquivo_csv_point)
dados_point.columns = dados_point.columns.str.strip().str.replace(' ', '')

# Seleção das colunas relevantes para o PointData
coluna_pe_direito_x = "rToe_X"
coluna_pe_esquerdo_x = "lToe_X"
coluna_pe_direito_y = "rToe_Y"
coluna_pe_esquerdo_y = "lToe_Y"
coluna_pe_direito_z = "rToe_Z"
coluna_pe_esquerdo_z = "lToe_Z"

# Calculando a distância tridimensional entre os pés direito e esquerdo no eixo X, Y e Z
distancia_x = dados_point[coluna_pe_direito_x] - dados_point[coluna_pe_esquerdo_x]
distancia_y = dados_point[coluna_pe_direito_y] - dados_point[coluna_pe_esquerdo_y]
distancia_z = dados_point[coluna_pe_direito_z] - dados_point[coluna_pe_esquerdo_z]

# Calculando a distância tridimensional
distancia_tridimensional = np.sqrt(distancia_x**2 + distancia_y**2 + distancia_z**2)

# Plotando o gráfico da distância tridimensional
plt.figure(figsize=(10, 6))
plt.plot(distancia_tridimensional, color="blue", linewidth=1, label="Distância Tridimensional (PointData)")
plt.xlabel("Tempo (índice das linhas)")
plt.ylabel("Distância")
plt.title("Distância Tridimensional entre os pés no Broad Jump - PointData")
plt.legend()
plt.show()

# --------------------------------------------------------

# Função para calcular a força resultante
def calcular_forca_resultante(dados, coluna_x, coluna_y, coluna_z):
    return np.sqrt(dados[coluna_x]**2 + dados[coluna_y]**2 + dados[coluna_z]**2)

# Seleção das colunas relevantes para as forças do pé direito e pé esquerdo no AnalogData
coluna_forca_pe_direito_x = "Force.Fx1"
coluna_forca_pe_direito_y = "Force.Fy1"
coluna_forca_pe_direito_z = "Force.Fz1"

coluna_forca_pe_esquerdo_x = "Force.Fx2"
coluna_forca_pe_esquerdo_y = "Force.Fy2"
coluna_forca_pe_esquerdo_z = "Force.Fz2"

# Calculando as forças resultantes para o pé direito e pé esquerdo
forca_resultante_pe_direito = calcular_forca_resultante(dados_analog, coluna_forca_pe_direito_x, coluna_forca_pe_direito_y, coluna_forca_pe_direito_z)
forca_resultante_pe_esquerdo = calcular_forca_resultante(dados_analog, coluna_forca_pe_esquerdo_x, coluna_forca_pe_esquerdo_y, coluna_forca_pe_esquerdo_z)

# Criando uma variável que irá representar cada captura dos pontos
variavel_contagem_analog = range(len(dados_analog))

# Gerando gráfico das forças resultantes do pé direito e pé esquerdo ao longo do tempo (AnalogData)
plt.figure(figsize=(12, 8))

plt.plot(variavel_contagem_analog, forca_resultante_pe_direito, label="Força Resultante Pé Direito (AnalogData)", color="red", linewidth=1)
plt.plot(variavel_contagem_analog, forca_resultante_pe_esquerdo, label="Força Resultante Pé Esquerdo (AnalogData)", linestyle='--', color="orange", linewidth=1)

# Adicionando rótulos e legenda ao gráfico
plt.xlabel("Tempo (índice das linhas)")
plt.ylabel("Força Resultante")
plt.title("Força Resultante do Pé Direito e Pé Esquerdo ao longo do tempo - AnalogData")
plt.legend()
plt.show()