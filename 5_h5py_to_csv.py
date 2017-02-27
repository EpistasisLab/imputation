import h5py
import argparse
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument("--name", type=str)
args = parser.parse_args()

f = h5py.File('./data/spikein/' + args.name, 'r')
X = f['dataset'][:]
np.savetxt('./data/spikeincsv/' + args.name + '.csv',
           X, delimiter=',', newline='\n')
