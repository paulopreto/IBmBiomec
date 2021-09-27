# -*- coding: utf-8 -*-
"""
Created on Sat Jun 13 08:35:07 2020

@author: preto
"""
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
    markers, labels, analog_data, freq3d, freqforc = importc3d(str(sys.argv[1]))
    marker01 = markers[:, 0, :]
    marker01_z = markers[:, 0, 2]
    # Pegar o valor do maxio em mm e nao a posicao do maximo
    plt.plot(marker01_z)
    plt.show()
    
    print(marker01_z)
    print(labels)
