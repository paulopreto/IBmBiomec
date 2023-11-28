import matplotlib.pyplot as plt
import numpy as np

def loadc3d(datc3d):
    from ezc3d import c3d
    datac3d = c3d(datc3d)
    point_data = datac3d['data']['points']
    analog_data = datac3d['data']['analogs']
    print(analog_data.shape)

    # Reshaping the analog data to 12 rows by 4360 columns
    reshaped_data = analog_data.reshape(12, 4360)
    return point_data, reshaped_data

def save_analog_data(reshaped_data, filename):
    np.savetxt(filename, reshaped_data.T, delimiter=',')
    return reshaped_data.T

if __name__ == '__main__':
    import sys
    point_data, reshaped_analog_data = loadc3d(sys.argv[1])
    data = save_analog_data(reshaped_analog_data, "analog_data.csv")
    
    # Plotting the third column
    plt.plot(data[:, 2])
    plt.title("Column 3 Analog Data")
    plt.xlabel("Sample Number")
    plt.ylabel("Value")
    plt.show()
