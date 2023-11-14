import c3d
import csv
import sys
import os
from itertools import chain

def save_point_data_to_csv(all_points, labels, csv_path):
    with open(csv_path, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)

        headers = []
        for label in labels:
            headers.extend([f"{label}_X", f"{label}_Y", f"{label}_Z"])
        csvwriter.writerow(headers)

        for i in range(len(all_points[labels[0]]['_X'])):
            row = []
            for label in labels:
                row.extend([all_points[label]['_X'][i], all_points[label]['_Y'][i], all_points[label]['_Z'][i]])
            csvwriter.writerow(row)

def save_analog_data_to_csv(all_analog_data, labels, csv_path):
    with open(csv_path, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)

        # Write the headers (labels)
        csvwriter.writerow(labels)

        # Get the number of frames (assuming all labels have the same length)
        num_frames = len(all_analog_data[labels[0]])

        # Write the data for each frame
        for i in range(num_frames):
            row = list(chain.from_iterable([all_analog_data[label][i] for label in labels]))  # Flatten the lists
            csvwriter.writerow(row)


def c3d_data_to_csv(c3d_path):
    with open(c3d_path, 'rb') as handle:
        reader = c3d.Reader(handle)

        base_name = os.path.splitext(c3d_path)[0]

        # Salve todos os `Point Data Channels` no mesmo arquivo
        all_points = {label: {'_X': [], '_Y': [], '_Z': []} for label in reader.point_labels}
        for _, frame, _ in reader.read_frames(copy=False):
            for idx, label in enumerate(reader.point_labels):
                all_points[label]['_X'].append(frame[idx][0])
                all_points[label]['_Y'].append(frame[idx][1])
                all_points[label]['_Z'].append(frame[idx][2])

        point_data_csv_path = f"{base_name}_PointDataChannels.csv"
        save_point_data_to_csv(all_points, reader.point_labels, point_data_csv_path)
        print(f"Salvou 'Point Data Channels' em '{point_data_csv_path}'")

        # Salve todos os `Analog Data Channels` no mesmo arquivo
        all_analog_data = {label: [] for label in reader.analog_labels}
        for _, _, analog in reader.read_frames(copy=False):
            for idx, label in enumerate(reader.analog_labels):
                all_analog_data[label].append(analog[idx])

        analog_data_csv_path = f"{base_name}_AnalogDataChannels.csv"
        save_analog_data_to_csv(all_analog_data, reader.analog_labels, analog_data_csv_path)
        print(f"Salvou 'Analog Data Channels' em '{analog_data_csv_path}'")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python script_name.py input.c3d")
        sys.exit(1)

    input_path = sys.argv[1]
    c3d_data_to_csv(input_path)
