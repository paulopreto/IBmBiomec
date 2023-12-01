import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Leitura dos arquivos CSV
arquivo_csv_point = "C:\\Users\\Victor Hugo Zani\\Downloads\\Spring01_PointDataChannels.csv"

# Leitura dos dados do arquivo PointData
dados_point = pd.read_csv(arquivo_csv_point)
dados_point.columns = dados_point.columns.str.strip().str.replace(' ', '')

# Seleção das colunas relevantes para o PointData (Cintura)
cintura_direita_x = "rHip_X"
cintura_esquerda_x = "lHip_X"
cintura_direita_y = "rHip_Y"
cintura_esquerda_y = "lHip_Y"
cintura_direita_z = "rHip_Z"
cintura_esquerda_z = "lHip_Z"

# Calculando a distância tridimensional 
distancia_x = dados_point[cintura_direita_x] - dados_point[cintura_esquerda_x]
distancia_y = dados_point[cintura_direita_y] - dados_point[cintura_esquerda_y]
distancia_z = dados_point[cintura_direita_z] - dados_point[cintura_esquerda_z]

# Calculando a distância tridimensional
distancia_tridimensional = np.sqrt(distancia_x**2 + distancia_y**2 + distancia_z**2)

# Plotando o gráfico da distância tridimensional (Cintura)
plt.figure(figsize=(10, 6))
plt.plot(distancia_tridimensional, color="blue", linewidth=1, label="Distância Tridimensional (Cintura)")
plt.xlabel("Tempo")
plt.ylabel("Distância")
plt.title("Distância Tridimensional dos pontos na cintura")
plt.legend()
plt.show()

# Seleção das colunas relevantes para o PointData (Ombro)
shoulder_direita_x = "rShoulder_X"
shoulder_esquerda_x = "lShoulder_X"
shoulder_direita_y = "rShoulder_Y"
shoulder_esquerda_y = "lShoulder_Y"
shoulder_direita_z = "rShoulder_Z"
shoulder_esquerda_z = "lShoulder_Z"

# Calculando a distância tridimensional entre os ombros no eixo X, Y e Z
distancia_x_ombro = dados_point[shoulder_direita_x] - dados_point[shoulder_esquerda_x]
distancia_y_ombro = dados_point[shoulder_direita_y] - dados_point[shoulder_esquerda_y]
distancia_z_ombro = dados_point[shoulder_direita_z] - dados_point[shoulder_esquerda_z]

# Calculando a distância tridimensional
distancia_tridimensional_ombro = np.sqrt(distancia_x_ombro**2 + distancia_y_ombro**2 + distancia_z_ombro**2)

# Plotando o gráfico da distância tridimensional (Ombro)
plt.figure(figsize=(10, 6))
plt.plot(distancia_tridimensional_ombro, color="red", linewidth=1, label="Distância Tridimensional (Ombro)")
plt.xlabel("Tempo")
plt.ylabel("Distância")
plt.title("Distância Tridimensional dos pontos no Ombro")
plt.legend()
plt.show()
