import argparse
import pickle as pkl
import numpy as np
import json
import os

import spikein

from sklearn.preprocessing import Imputer
from fancyimpute import (SimpleFill, KNN, SoftImpute, IterativeSVD,
                         MICE, MatrixFactorization,
                         NuclearNormMinimization, BiScaler,
                         AutoEncoder)


def run(run_name='test', file_name='gaussian.pkl', spike_in='MCAR',
        missing=[0.1, 0.2, 0.3, 0.4, 0.5], trials=1):
    print('Run ' + file_name + ' for ' + str(trials) + ' trials with ' +
          spike_in + 'and' + str(missing), 'missing')
    random_seed = 123
    np.random.seed(seed=random_seed)

    # load file
    dataset = load_file(file_name)
    X = dataset[:, :-1]

    # for non-simulated data may need to normalize/scale
    full_scores = {}
    for m in missing:
        for t in range(trials):
            print('Run ', file_name, ' trial: ', t, ' missing ', str(m))

            # @TODO this is replaced
            spiker = getattr(spikein, spike_in)()
            X_corrupt = spiker.spikein(X.copy(), m)

            scores = {}
            X_simple_mean = SimpleFill(fill_method='mean').complete(X_corrupt)
            scores['simple_mean'] = evaluate(X, X_simple_mean)

            X_simple_median = (SimpleFill(fill_method='median')
                               .complete(X_corrupt))
            scores['simple_median'] = evaluate(X, X_simple_median)

            # X_ae_1 = AutoEncoder(hidden_layer_sizes=[400],
            #                      max_training_epochs=500).complete(X_corrupt)
            # scores['AE_1'] = evaluate(X, X_ae_1)

            # X_ae_2 = AutoEncoder(hidden_layer_sizes=[400, 200],
            #                      max_training_epochs=500).complete(X_corrupt)
            # scores['AE_2'] = evaluate(X, X_ae_1)
            # # X_dA =

            # # X_MICE_2 = MICE(n_nearest_columns=80, n_imputations=100,
            # #                 n_burn_in=5,
            # #                 model=(BayesianRidgeRegression(lambda_reg=2)),
            # #                 init_fill_method="mean").complete(X_corrupt)
            # # print('X_MICE', evaluate(X, X_MICE))

            # X_filled_svd_10 = IterativeSVD(rank=10).complete(X_corrupt)
            # scores['svd_10'] = evaluate(X, X_filled_svd_10)
            # X_filled_svd_20 = IterativeSVD(rank=20).complete(X_corrupt)
            # scores['svd_20'] = evaluate(X, X_filled_svd_20)
            # X_filled_svd_40 = IterativeSVD(rank=40).complete(X_corrupt)
            # scores['svd_40'] = evaluate(X, X_filled_svd_40)

            # X_filled_si = SoftImpute().complete(X_corrupt)
            # scores['si'] = evaluate(X, X_filled_si)

            # X_filled_knn1 = KNN(k=1).complete(X_corrupt)
            # scores['knn1'] = evaluate(X, X_filled_knn1)
            # X_filled_knn3 = KNN(k=3).complete(X_corrupt)
            # scores['knn3'] = evaluate(X, X_filled_knn3)
            # X_filled_knn5 = KNN(k=5).complete(X_corrupt)
            # scores['knn5'] = evaluate(X, X_filled_knn5)
            # X_filled_knn7 = KNN(k=7).complete(X_corrupt)
            # scores['knn7'] = evaluate(X, X_filled_knn7)
            # X_filled_knn15 = KNN(k=15).complete(X_corrupt)
            # scores['knn15'] = evaluate(X, X_filled_knn15)

            print(json.dumps(scores, indent=4))
            full_scores[str(m) + '_' + str(t)] = scores

            # excluded for speed for now
            # X_filled_nnm = NuclearNormMinimization().complete(X_corrupt)
            # print('nnm', evaluate(X, X_filled_nnm))

    save_results(run_name, file_name, spike_in, missing, trials, full_scores)


def save_results(run_name, file_name, spike_in, missing, trials, full_scores):
    print('saving results')
    path = './output/' + run_name
    if not os.path.exists(path):
        os.makedirs(path)
    path += '/'

    info_dict = {'name': run_name, 'data': file_name, 'spike_method': spike_in,
                 'missing': missing, 'trials': trials, 'scores': full_scores}

    # save human readable
    with open(path + 'details.json', 'w') as outfile:
        json.dump(info_dict, outfile)

    # save pickle form
    pkl.dump(full_scores, open(path + 'scores.p', "wb"))

    # corrupt + filled in version?
    # @TODO


def load_file(file_name):
    print(file_name)
    path = './data/' + str(file_name)
    # path = file_name
    dataset = pkl.load(open(path, 'rb'))
    return dataset


def evaluate(X, X_imputed, method='mse'):
    if method == 'mse':
        return ((X - X_imputed) ** 2).mean(axis=None)
    elif method == 'binary_cross_entropy':
        print('Not Implemented')
        raise Exception('Binary Cross Entropy Not Implemented')

    eval_methods = {'mse': mse, 'binary_cross_entropy': binary_cross_entropy}
    return eval_methods[method].score(X, X_imputed)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("--name", type=str)
    parser.add_argument("--file_name", type=str, help="name of file")
    parser.add_argument("--spike_in", type=str, default="MCAR",
                        help='spike in method: MCAR, NMAR @TODO others')
    parser.add_argument("--spike_rate", help="list of missing values",
                        type=float, nargs="*")
    parser.add_argument("--trials", help="list of missing values",
                        type=int, default=1)
    parser.add_argument("--eval_method", type=str, default="mse")
    # @TODO specify imputation strategies

    args = parser.parse_args()
    if args.missing_rate is None:
        args.missing_rate = [0.1, 0.2, 0.3, 0.4, 0.5]
    else:
        args.missing_rate = [int(x) for x in args.patient_counts]

    if args.trials is None:
        args.trials = 1
    else:
        args.trials = int(args.trials)

    run(args.name, args.file_name, args.spike_in,
        args.missing_rate, args.trials)
