import os
import argparse


def build_jobs(folder_name):
    i = 0
    for f in os.listdir('./data/spikeincsv/' + folder_name):
        if not f.startswith('.'):
            f_split = f.split('.csv')[0]
            file_name = f_split + '.sh'
            print(file_name)

            f1 = open('./jobs/' + file_name, 'w+')
            f1.write('#!/bin/bash \n')
            f1.write('#BSUB -J ' + f_split + '\n')
            f1.write('#BSUB -o ./job_out/' + f_split + '.%J.out' + '\n')
            f1.write('#BSUB -e ./job_out/' + f_split + '.%J.error' + '\n')
            f1.write('\n')

            # SAVE fULL IMPUTED VALUES OF FIRST RUN ONLY
            if i == 0:
                f1.write('module load python/2.7.10 \n')
                f1.write('python 3_run_python_prespiked.py --folder' +
                         folder_name + ' --name ' + file_name +
                         ' --run_all 1 --save_imputed 1 \n')
                f1.write('module load R \n')
                f1.write('Rscript 3_run_r_prespiked.R ' + folder_name + ' ' +
                         f_split + ' 1 \n')
            else:
                f1.write('module load python/2.7.10 \n')
                f1.write('python 3_run_python_prespiked.py --folder' +
                         folder_name + ' --name ' + file_name +
                         ' --run_all 1 --save_imputed 1 \n')
                f1.write('module load R \n')
                f1.write('Rscript 3_run_r_prespiked.R ' + folder_name + ' ' +
                         f_split + ' 0 \n')
            i += 1


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--folder", type=str, default="all")
    args = parser.parse_args()

    if args.folder in ['MCAR', 'all']:
        build_jobs('MCAR')

    if args.folder in ['MNAR', 'all']:
        build_jobs('MNAR')

    if args.folder in ['MAR', 'all']:
        build_jobs('MAR')

    if args.folder in ['TEST']:
        build_jobs('TEST')
