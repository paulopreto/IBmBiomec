# -*- coding: utf-8 -*-
"""
Created on 28-09-2021
@author: preto

"""

import numpy as np
import matplotlib.pyplot as plt
from ezc3d import c3d
import sys

def importc3d(dat=None):
    # dat = input('Qual o c3d voce quer carregar? ')
    # dat = 'Mayara05.c3d'
    c = c3d(dat)
    print('\nNumber of markers = ', c['parameters']['POINT']['USED']['value'][0])  # Print the number of points used
    print('Numer of analogs = ', c['parameters']['ANALOG']['USED']['value'][0])
    point_data = c['data']['points']
    points_residuals = c['data']['meta_points']['residuals']
    analog_data = c['data']['analogs']
    labels = c['parameters']['POINT']['LABELS']['value']
    markers = point_data[[0, 1, 2]].T
    freq3d = c['header']['points']['frame_rate']
    freqforce = c['parameters']['ANALOG']['RATE']['value'][0]
    
    return markers, labels, analog_data, freq3d, freqforce 

# markers, labels, analog_data, freq3d, freqforce = importc3d()

if __name__ == '__main__':
    markers, labels, analog_data, freq3d, freqforc = importc3d('qualisys.c3d')
    marker01 = markers[:, 0, :]

    marker01_z = markers[:, 0, 2] / 1000
    
    
    print(labels)
    
    # Selecionar o valor do maximo de marker01_z e arredondar para o valor mais proximo
    max_marker01_z = np.round(np.max(marker01_z), 2)
    

    # Selecionar o indice do valor maximo de marker01_z
    max_marker01_z_index = np.argmax(marker01_z)
   
    print(f'A altura máxima foi de: {max_marker01_z} metros')
    print(f'O indice do valor máximo foi: {max_marker01_z_index}')

    plt.plot(marker01_z)
    plt.plot(max_marker01_z_index, max_marker01_z, 'ro')
    # plot text with max_marker01_z and max_marker01_z_index
    plt.text(max_marker01_z_index, max_marker01_z, f'{max_marker01_z} m')
    plt.title('Altura de salto arquivo qualisys.c3d')
    plt.show()
     
