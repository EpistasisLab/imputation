DIRECTORY=./data/mar/
N=16

for i in $DIRECTORY/MAR_*; do
(
   python 5_h5py_to_csv.py --name $i
) done
