import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# carregue os dados usando o pandas
dados = pd.read_csv('/mnt/c/trabalho3/Sit_five02_AnalogDataChannels.csv')

# Exibir os nomes das colunas disponíveis no DataFrame
print(dados.columns)

dados_pe_direito = dados[['Force.Fx1       ', 'Force.Fy1       ', 'Force.Fz1       ']]
dados_pe_esquerdo = dados[['Force.Fx2       ', 'Force.Fy2       ', 'Force.Fz2       ']]

vetor_resultante_pe_direito = np.sqrt(np.sum(dados_pe_direito**2, axis=1))
vetor_resultante_pe_esquerdo = np.sqrt(np.sum(dados_pe_esquerdo**2, axis=1))

tempo = range(len(dados))

# Criar gráfico para o vetor resultante total
plt.figure()
plt.plot(tempo, vetor_resultante_pe_direito, label='pé direito')
plt.plot(tempo, vetor_resultante_pe_esquerdo, label='pé esquerdo')
plt.xlabel('Tempo')
plt.ylabel('Força')
plt.legend()
plt.title('Variação da Força ao Longo do Tempo')

nome_arquivo = 'grafico_forca.png'
plt.savefig(nome_arquivo)
