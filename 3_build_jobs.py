import os
import argparse


def build_jobs(folder_name):
    i = 0
    for f in os.listdir('./data/spikeincsv/' + folder_name):
        if not f.startswith('.'):
            f_split = f.split('.csv')[0]
            file_name = f_split + '.sh'
            print(file_name)

            f1 = open('./jobs/' + folder + '/' + file_name, 'w+')
            f1.write('#!/bin/bash \n')
            f1.write('#BSUB -J ' + f_split + '\n')
            f1.write('#BSUB -o ./' + folder + '/job_out/' + f_split +
                     '.%J.out' + '\n')
            f1.write('#BSUB -e ./' + folder + '/job_out/' + f_split +
                     '.%J.error' + '\n')
            f1.write('\n')

            # SAVE fULL IMPUTED VALUES OF FIRST RUN ONLY
            if i == 0:
                f1.write('module load python/2.7.10 \n')
                f1.write('python 3_run_python_prespiked.py --folder' +
                         folder_name + ' --name ' + file_name +
                         ' --run_all 1 --save_imputed 1 \n')
            else:
                f1.write('module load python/2.7.10 \n')
                f1.write('python 3_run_python_prespiked.py --folder' +
                         folder_name + ' --name ' + file_name +
                         ' --run_all 1 --save_imputed 0 \n')

            # R Run - break out for simple_median
            f_split2 = 'R_' + fsplit
            file_name2 = f_split2 + '.sh'
            print(file_name2)

            f2 = open('./jobs/' + file_name2, 'w+')
            f2.write('#!/bin/bash \n')
            f2.write('#BSUB -J ' + f_split2 + '\n')
            f2.write('#BSUB -o ./job_out/' + f_split2 + '.%J.out' + '\n')
            f2.write('#BSUB -e ./job_out/' + f_split2 + '.%J.error' + '\n')
            f2.write('\n')

            if i == 0:
                f2.write('module load R \n')
                f2.write('Rscript 3_run_r_prespiked.R ' + folder_name + ' ' +
                         f_split + ' 1 \n')
            else:
                f2.write('module load R \n')
                f2.write('Rscript 3_run_r_prespiked.R ' + folder_name + ' ' +
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
