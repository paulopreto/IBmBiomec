import os
import sys
import numpy as np

def disteucl(file1, file2):
	ini = np.loadtxt(file1)
	fim = np.loadtxt(file2)
	print(ini, fim)

	return ini

def velocidade(dist):
	vel = dist*1
	return vel

def main():
		file1 = sys.argv[1]
	file2 = sys.argv[2]
	print("oi")
	dist = disteucl(file1, file2)

	vel = velocidade(0)
	#print(dist, vel)

if __name__ == "__main__":
	main()


