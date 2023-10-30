import matplotlib.pyplot as plt
import numpy as np

# Função para obter dados da câmera e projeção
def get_camera_and_projection_data(camera_num):
    print(f"Digite os Dados da Camera {camera_num}")
    xc = float(input(f"Coordenada x da camera {camera_num}: "))
    yc = float(input(f"Coordenada y da camera {camera_num}: "))

    print(f"Digite os Dados da Projeção da Camera {camera_num}")
    xp = float(input(f"Coordenada x da projeção {camera_num}: "))
    yp = float(input(f"Coordenada y da projeção {camera_num}: "))

    return xc, yc, xp, yp

# Obter dados da câmera 1
xc1, yc1, xp1, yp1 = get_camera_and_projection_data(1)

# Obter dados da câmera 2
xc2, yc2, xp2, yp2 = get_camera_and_projection_data(2)

# Cálculo das inclinações e interceptos das retas
mr1 = (yp1 - yc1) / (xp1 - xc1)
mr2 = (yp2 - yc2) / (xp2 - xc2)
br1 = -1 * (mr1 * xc1 - yc1)  # coeficiente linear de r1
br2 = -1 * (mr2 * xc2 - yc2)  # coeficiente linear de r2

# Cálculo do ponto de cruzamento
xi = (-(mr2 * xc2) + yc2 + (mr1 * xc1) - yc1) / (mr1 - mr2)
yi = (mr1 * xi) - (mr1 * xc1) + yc1

# Posição do objeto reconstruído
print("Resultado:\nPosição x da reconstrução (xi):", xi, "\nPosição y da reconstrução (yi):", yi, "\nVide gráfico para representação visual")

# Geração do gráfico
x1 = np.linspace(0, 500)
y1 = mr1 * x1 + br1

x2 = np.linspace(0, 500)
y2 = mr2 * x2 + br2

plt.plot(x1, y1, label="Reta 1")
plt.plot(x2, y2, label="Reta 2")
plt.scatter(xi, yi, color='purple', label="Posição do objeto no plano xy")
plt.scatter(xc1, yc1, color='blue', label="Posição da câmera 1 no plano xy")
plt.scatter(xc2, yc2, color='red', label="Posição da câmera 2 no plano xy")

plt.xlabel('Eixo x')
plt.ylabel('Eixo y')
plt.title("Gráfico de cruzamento de retas para os dados fornecidos")
plt.legend(framealpha=0.5)
plt.show()
