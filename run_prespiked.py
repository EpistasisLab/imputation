import pickle as pkl
import numpy as np
import argparse

from sklearn.preprocessing import Imputer
from fancyimpute import (SimpleFill, KNN, SoftImpute, IterativeSVD,
                         MICE, MatrixFactorization,
                         NuclearNormMinimization, BiScaler,
                         AutoEncoder)


def run(name, patients, run_all, save_imputed):
    random_seed = 123
    np.random.seed(seed=random_seed)

    X_corrupt = load_file(name + 'SpikeIn')[:patients]
    X = load_file(name)[:patients]

    scores = {'simple_mean': [], 'simple_median': [], 'svd_4': [],
              'svd_8': [], 'svd_16': [], 'svd_24': [], 'si': [],
              'knn_1': [], 'knn_3': [], 'knn_9': [], 'knn_15': [],
              'knn_30': []}

    if run_all:
        scores['MICE'] = []
        scores['MatrixFactor'] = []
        scores['NuclearMin'] = []
        scores['BiScaler'] = []

    # range 1 if only 1 spike in
    for i in range(1):
        print("Iteration " + str(i))

        simple_mean_X = SimpleFill(fill_method='mean').complete(X_corrupt)
        scores['simple_mean'].append(evaluate(simple_mean_X, X))

        simple_median_X = SimpleFill(fill_method='median').complete(X_corrupt)
        scores['simple_median'].append(evaluate(simple_median_X, X))

        svd_4_X = IterativeSVD(rank=4).complete(X_corrupt)
        scores['svd_4'].append(evaluate(svd_4_X, X))

        svd_8_X = IterativeSVD(rank=8).complete(X_corrupt)
        scores['svd_8'].append(evaluate(svd_8_X, X))

        svd_16_X = IterativeSVD(rank=16).complete(X_corrupt)
        scores['svd_16'].append(evaluate(svd_16_X, X))

        svd_24_X = IterativeSVD(rank=24).complete(X_corrupt)
        scores['svd_24'].append(evaluate(svd_24_X, X))

        si_X = SoftImpute().complete(X_corrupt)
        scores['si'].append(evaluate(si_X, X))

        knn_1_X = KNN(k=1).complete(X_corrupt)
        scores['knn_1'].append(evaluate(knn_1_X, X))

        knn_3_X = KNN(k=3).complete(X_corrupt)
        scores['knn_3'].append(evaluate(knn_3_X, X))

        knn_9_X = KNN(k=9).complete(X_corrupt)
        scores['knn_9'].append(evaluate(knn_9_X, X))

        knn_15_X = KNN(k=15).complete(X_corrupt)
        scores['knn_15'].append(evaluate(knn_15_X, X))

        knn_30_X = KNN(k=30).complete(X_corrupt)
        scores['knn_30'].append(evaluate(knn_30_X, X))

        if save_imputed:
            np.savetxt('./output/sweeps' + name + '_simple_mean.csv',
                       simple_mean_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_simple_median.csv',
                       simple_median_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_svd_4.csv',
                       svd_4_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_svd_8.csv',
                       svd_8_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_svd_16.csv',
                       svd_16_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_svd_24.csv',
                       svd_24_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_si_4.csv',
                       si_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_knn_1.csv',
                       knn_1_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_knn_3.csv',
                       knn_3_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_knn_9.csv',
                       knn_9_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_knn_15.csv',
                       knn_15_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps' + name + '_knn_30.csv',
                       knn_30_X, delimiter=',', newline='\n')

        if run_all:
            mice_X = MICE().complete(X_corrupt)
            scores['MICE'].append(evaluate(mice_X, X))

            matrix_fact_X = MatrixFactorization().complete(X_corrupt)
            scores['MatrixFact'].append(evaluate(matrix_fact_X, X))

            nnm_X = NuclearNormMinimization().complete(X_corrupt)
            scores['NuclearMin'].append(evaluate(nnm_X, X))

            biscaler_X = BiScaler().complete(X_corrupt)
            scores['biscaler'].append(evaluate(biscaler_X, X))

            if save_imputed:
                np.savetxt('./output/sweeps' + name + '_MICE.csv',
                           mice_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps' + name + '_matrix_fact.csv',
                           matrix_fact_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps' + name + '_nnm.csv',
                           nnm_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps' + name + '_biscaler.csv',
                           biscaler_X, delimiter=',', newline='\n')

        print(scores)

    pkl.dump(scores, open('./output/sweeps/' + name + '_' + str(patients) +
                          '.p', 'w'))


def evaluate(X, X_imputed, method='mse'):
    if method == 'mse':
        X = np.nan_to_num(X)
        X_imputed = np.nan_to_num(X_imputed)
        mse = ((X - X_imputed) ** 2).mean(axis=None)
        return mse


def load_file(name):
    print(name)
    X = np.genfromtxt('./data/' + name + '.csv', delimiter=',',
                      skip_header=1)
    print(X.shape)
    return X


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--name", type=str)
    parser.add_argument("--patients", type=int)
    parser.add_argument("--run_all", type=int, default=0)
    parser.add_argument("--save_imputed", type=int, default=0)

    args = parser.parse_args()
    run(args.name, args.patients, args.run_all, args.save_imputed)
