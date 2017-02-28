import os
methods = ["pmm", "norm", "norm.nob", "norm.boot", "norm.predict", "mean",
           "rf", "ri", "sample"]

for f in os.listdir('./data'):
    if not f.startswith('.') and not f.startswith('complete'):
        for method in methods:
            f_split = f.split('.csv')[0] + '_' + method
            file_name = f_split + '.sh'
            print(file_name)

            f1 = open('./jobs/' + file_name, 'w+')
            f1.write('#!/bin/bash \n')
            f1.write('#BSUB -J ' + f_split + '\n')
            f1.write('#BSUB -o ./job_out/' + f_split + '.%J.out' + '\n')
            f1.write('#BSUB -e ./job_out/' + f_split + '.%J.error' + '\n')
            f1.write('\n')
            f1.write('module load R \n')
            f1.write('Rscript ImputeTest.R ' + f.split('.csv')[0] + ' ' + method)
