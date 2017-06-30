DIRECTORY=./data/spikein/
N=16

for i in $DIRECTORY/MAR_*; do
(
   python 4_run_prespiked.py --name $i --run_all 1 --save_imputed 0
) done
