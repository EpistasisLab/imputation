DIRECTORY=./data/spikein/

for i in $DIRECTORY/MAR_*; do
     python 4_run_prespiked.py --name $i --run_all 1 --save_imputed 1 &
done
