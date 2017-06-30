import os
import argparse


def build_jobs(folder_name):


    for f in os.listdir('./data'):
        if not f.startswith('.') and not f.startswith('complete'):
            f_split = f.split('.csv')[0]
            file_name = f_split + '.sh'
            print(file_name)

            f1 = open('./jobs/' + file_name, 'w+')
            f1.write('#!/bin/bash \n')
            f1.write('#BSUB -J ' + f_split + '\n')
            f1.write('#BSUB -o ./job_out/' + f_split + '.%J.out' + '\n')
            f1.write('#BSUB -e ./job_out/' + f_split + '.%J.error' + '\n')
            f1.write('\n')
            f1.write('module load R \n')
            f1.write('Rscript ImputeTest.R ' + f.split('.csv')[0])


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
