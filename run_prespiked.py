import pickle as pkl
import numpy as np
import argparse

from sklearn.preprocessing import Imputer
from fancyimpute import (SimpleFill, KNN, SoftImpute, IterativeSVD,
                         MICE, MatrixFactorization,
                         NuclearNormMinimization, BiScaler,
                         AutoEncoder)


def run(name, patients):
    random_seed = 123
    np.random.seed(seed=random_seed)

    X_corrupt = load_file(name + 'SpikeIn')[:patients]
    X = load_file(name)[:patients]

    scores = {'simple_mean': [], 'simple_median': [], 'svd_4': [],
              'svd_8': [], 'svd_16': [], 'svd_24': [], 'si': [],
              'knn_1': [], 'knn_3': [], 'knn_9': [], 'knn_15': [],
              'knn_30': []}
    for i in range(10):
        print("Iteration " + str(i))
        scores['simple_mean'].append(evaluate(SimpleFill(fill_method='mean')
                                              .complete(X_corrupt), X))
        scores['simple_median'].append(evaluate(SimpleFill(fill_method='median')
                                                .complete(X_corrupt), X))
        scores['svd_4'].append(evaluate(IterativeSVD(rank=4)
                                        .complete(X_corrupt), X))
        scores['svd_8'].append(evaluate(IterativeSVD(rank=8)
                                        .complete(X_corrupt), X))
        scores['svd_16'].append(evaluate(IterativeSVD(rank=16)
                                         .complete(X_corrupt), X))
        scores['svd_24'].append(evaluate(IterativeSVD(rank=24)
                                         .complete(X_corrupt), X))
        scores['si'].append(evaluate(SoftImpute()
                                     .complete(X_corrupt), X))
        scores['knn_1'].append(evaluate(KNN(k=1).complete(X_corrupt), X))
        scores['knn_3'].append(evaluate(KNN(k=3).complete(X_corrupt), X))
        scores['knn_9'].append(evaluate(KNN(k=9).complete(X_corrupt), X))
        scores['knn_15'].append(evaluate(KNN(k=15).complete(X_corrupt), X))
        scores['knn_30'].append(evaluate(KNN(k=30).complete(X_corrupt), X))
        print(scores)

    pkl.dump(scores, open('./output/sweeps/' + name + '_' + str(patients) + '.p', 'w'))


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

    args = parser.parse_args()
    run(args.name, args.patients)
