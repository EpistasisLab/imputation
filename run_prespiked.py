import pickle as pkl
import numpy as np
import argparse

from sklearn.preprocessing import Imputer
from fancyimpute import (SimpleFill, KNN, SoftImpute, IterativeSVD,
                         MICE, MatrixFactorization,
                         NuclearNormMinimization, BiScaler,
                         AutoEncoder)
from fancyimpute.bayesian_ridge_regression import BayesianRidgeRegression


def run(name, patients, run_all, save_imputed):
    random_seed = 123
    np.random.seed(seed=random_seed)

    folds = 10
    patient_count, features = load_file(name).shape
    fold_size = patient_count / folds

    base_name = name
    # range 1 if only 1 spike in
    for i in range(folds):
        name = base_name + '_' + str(i)

        start = i*fold_size
        end = (1+i) * fold_size

        X_corrupt = load_file(base_name + 'SpikeIn')[start:end]
        X = load_file(base_name)[start:end]

        np.savetxt('./output/sweeps/' + name + '_input.csv',
                   X, delimiter=',', newline='\n')

        scores = {'mean': [], 'median': [], 'random': [], 'svd_1': [],
                  'svd_2': [], 'svd_3': [], 'svd_4': [], 'svd_5': [],
                  'svd_6': [], 'svd_7': [], 'svd_8': [], 'svd_9': [],
                  'svd_10': [],
                  'svd_11': [], 'svd_12': [], 'svd_13': [], 'svd_14': [],
                  'svd_15': [], 'svd_16': [], 'svd_17': [], 'svd_18': [],
                  'svd_19': [], 'svd_20': [], 'svd_21': [], 'svd_22': [],
                  'svd_23': [], 'svd_24': [], 'si': [], 'si_s_half': [],
                  'si_s_1': [], 'si_s_2': [], 'si_s_4': [], 'si_s_8': [],
                  'si_s_16': [], 'si_s_32': [], 'si_s_64': [], 'si_s_128': [],
                  'MICE_col_lambda_reg_25': [], 'MICE_col_lambda_reg_10': [],
                  'MICE_col_lambda_reg_1': [], 'MICE_col_lambda_reg_01': [],
                  'MICE_col_lambda_reg_001': [], 'MICE_pmm': [],
                  'MICE_pmm_lambda_reg_25': [],
                  'MICE_pmm_lambda_reg_10': [], 'MICE_pmm_lambda_reg_1': [],
                  'MICE_pmm_lambda_reg_01': [], 'MICE_pmm_lambda_reg_001': [],
                  'knn_1': [], 'knn_3': [], 'knn_9': [], 'knn_15': [],
                  'knn_30': [], 'knn_81': [], 'knn_243': [], 'knn_751': [],
                  'knn_2000': [], 'knn_6000': [], 'MatricxFactor': [],
                  'NuclearMin': []}

        print("Iteration " + str(i))

        simple_mean_X = SimpleFill(fill_method='mean').complete(X_corrupt)
        scores['simple_mean'].append(evaluate(simple_mean_X, X))

        simple_median_X = SimpleFill(fill_method='median').complete(X_corrupt)
        scores['simple_median'].append(evaluate(simple_median_X, X))

        random_X = SimpleFill(fill_method='random').complete(X_corrupt)
        scores['random'].append(evaluate(random_X, X))

        # SVD
        svd_1_X = IterativeSVD(rank=1).complete(X_corrupt)
        scores['svd_1'].append(evaluate(svd_1_X, X))

        svd_2_X = IterativeSVD(rank=2).complete(X_corrupt)
        scores['svd_2'].append(evaluate(svd_2_X, X))

        svd_3_X = IterativeSVD(rank=3).complete(X_corrupt)
        scores['svd_3'].append(evaluate(svd_3_X, X))

        svd_4_X = IterativeSVD(rank=4).complete(X_corrupt)
        scores['svd_4'].append(evaluate(svd_4_X, X))

        svd_5_X = IterativeSVD(rank=5).complete(X_corrupt)
        scores['svd_5'].append(evaluate(svd_5_X, X))

        svd_6_X = IterativeSVD(rank=6).complete(X_corrupt)
        scores['svd_6'].append(evaluate(svd_6_X, X))

        svd_7_X = IterativeSVD(rank=7).complete(X_corrupt)
        scores['svd_7'].append(evaluate(svd_7_X, X))

        svd_8_X = IterativeSVD(rank=8).complete(X_corrupt)
        scores['svd_8'].append(evaluate(svd_8_X, X))

        svd_9_X = IterativeSVD(rank=9).complete(X_corrupt)
        scores['svd_9'].append(evaluate(svd_9_X, X))

        svd_10_X = IterativeSVD(rank=10).complete(X_corrupt)
        scores['svd_10'].append(evaluate(svd_10_X, X))

        svd_11_X = IterativeSVD(rank=11).complete(X_corrupt)
        scores['svd_11'].append(evaluate(svd_11_X, X))

        svd_12_X = IterativeSVD(rank=12).complete(X_corrupt)
        scores['svd_12'].append(evaluate(svd_12_X, X))

        svd_13_X = IterativeSVD(rank=13).complete(X_corrupt)
        scores['svd_13'].append(evaluate(svd_13_X, X))

        svd_14_X = IterativeSVD(rank=14).complete(X_corrupt)
        scores['svd_14'].append(evaluate(svd_14_X, X))

        svd_15_X = IterativeSVD(rank=15).complete(X_corrupt)
        scores['svd_15'].append(evaluate(svd_15_X, X))

        svd_16_X = IterativeSVD(rank=16).complete(X_corrupt)
        scores['svd_16'].append(evaluate(svd_16_X, X))

        svd_17_X = IterativeSVD(rank=17).complete(X_corrupt)
        scores['svd_17'].append(evaluate(svd_17_X, X))

        svd_18_X = IterativeSVD(rank=18).complete(X_corrupt)
        scores['svd_18'].append(evaluate(svd_18_X, X))

        svd_19_X = IterativeSVD(rank=19).complete(X_corrupt)
        scores['svd_19'].append(evaluate(svd_19_X, X))

        svd_20_X = IterativeSVD(rank=20).complete(X_corrupt)
        scores['svd_20'].append(evaluate(svd_20_X, X))

        svd_21_X = IterativeSVD(rank=21).complete(X_corrupt)
        scores['svd_21'].append(evaluate(svd_21_X, X))

        svd_22_X = IterativeSVD(rank=22).complete(X_corrupt)
        scores['svd_22'].append(evaluate(svd_22_X, X))

        svd_23_X = IterativeSVD(rank=23).complete(X_corrupt)
        scores['svd_23'].append(evaluate(svd_23_X, X))

        svd_24_X = IterativeSVD(rank=24).complete(X_corrupt)
        scores['svd_24'].append(evaluate(svd_24_X, X))

        si_X = SoftImpute().complete(X_corrupt)
        scores['si'].append(evaluate(si_X, X))

        si_s_half_X = SoftImpute(shrinkage_value=0.5).complete(X_corrupt)
        scores['si_s_half'].append(evaluate(si_s_half_X, X))

        si_s_1_X = SoftImpute(shrinkage_value=1).complete(X_corrupt)
        scores['si_s_1'].append(evaluate(si_s_1_X, X))

        si_s_2_X = SoftImpute(shrinkage_value=2).complete(X_corrupt)
        scores['si_s_2'].append(evaluate(si_s_2_X, X))

        si_s_4_X = SoftImpute(shrinkage_value=4).complete(X_corrupt)
        scores['si_s_4'].append(evaluate(si_s_4_X, X))

        si_s_8_X = SoftImpute(shrinkage_value=8).complete(X_corrupt)
        scores['si_s_8'].append(evaluate(si_s_8_X, X))

        si_s_16_X = SoftImpute(shrinkage_value=16).complete(X_corrupt)
        scores['si_s_16'].append(evaluate(si_s_16_X, X))

        si_s_32_X = SoftImpute(shrinkage_value=32).complete(X_corrupt)
        scores['si_s_32'].append(evaluate(si_s_32_X, X))

        si_s_64_X = SoftImpute(shrinkage_value=64).complete(X_corrupt)
        scores['si_s_64'].append(evaluate(si_s_64_X, X))

        si_s_128_X = SoftImpute(shrinkage_value=128).complete(X_corrupt)
        scores['si_s_128'].append(evaluate(si_s_128_X, X))

        pkl.dump(scores, open('./output/sweeps/base_scores_' + name +
                              '_' + str(patients) + '.p', 'w'))

        if save_imputed:
            np.savetxt('./output/sweeps/' + name + '_simple_mean.csv',
                       simple_mean_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_simple_median.csv',
                       simple_median_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_simple_random.csv',
                       random_X, delimiter=',', newline='\n'),
            np.savetxt('./output/sweeps/' + name + '_svd_1.csv',
                       svd_1_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_2.csv',
                       svd_2_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_3.csv',
                       svd_3_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_4.csv',
                       svd_4_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_5.csv',
                       svd_5_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_6.csv',
                       svd_6_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_7.csv',
                       svd_7_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_8.csv',
                       svd_8_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_9.csv',
                       svd_9_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_10.csv',
                       svd_10_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_11.csv',
                       svd_11_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_12.csv',
                       svd_12_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_13.csv',
                       svd_13_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_14.csv',
                       svd_14_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_15.csv',
                       svd_15_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_16.csv',
                       svd_16_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_17.csv',
                       svd_17_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_18.csv',
                       svd_18_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_19.csv',
                       svd_19_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_20.csv',
                       svd_20_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_21.csv',
                       svd_21_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_22.csv',
                       svd_22_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_23.csv',
                       svd_23_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_svd_24.csv',
                       svd_24_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si.csv',
                       si_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_half.csv',
                       si_s_half_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_1.csv',
                       si_s_1_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_2.csv',
                       si_s_2_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_4.csv',
                       si_s_4_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_8.csv',
                       si_s_8_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_16.csv',
                       si_s_16_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_32.csv',
                       si_s_32_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_64.csv',
                       si_s_64_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name + '_si_s_128.csv',
                       si_s_128_X, delimiter=',', newline='\n')

        if run_all:
            mice_X = MICE().complete(X_corrupt)
            scores['MICE'].append(evaluate(mice_X, X))

            mice_col_lambda_reg_25 = MICE(model=BayesianRidgeRegression(lambda_reg=0.25)).complete(X_corrupt)
            scores['MICE_col_lambda_reg_25'].append(evaluate(mice_col_lambda_reg_25, X))            

            mice_col_lambda_reg_10 = MICE(model=BayesianRidgeRegression(lambda_reg=0.1)).complete(X_corrupt)
            scores['MICE_col_lambda_reg_10'].append(evaluate(mice_col_lambda_reg_10, X))

            mice_col_lambda_reg_1 = MICE(model=BayesianRidgeRegression(lambda_reg=0.01)).complete(X_corrupt)
            scores['MICE_col_lambda_reg_1'].append(evaluate(mice_col_lambda_reg_1, X))

            mice_col_lambda_reg_01 = MICE(model=BayesianRidgeRegression(lambda_reg=0.001)).complete(X_corrupt)
            scores['MICE_col_lambda_reg_01'].append(evaluate(mice_col_lambda_reg_01, X))

            mice_col_lambda_reg_001 = MICE(model=BayesianRidgeRegression(lambda_reg=0.0001)).complete(X_corrupt)
            scores['MICE_col_lambda_reg_001'].append(evaluate(mice_col_lambda_reg_001, X))

            mice_pmm_X = MICE(impute_type='pmm').complete(X_corrupt)
            scores['MICE_pmm'].append(evaluate(mice_pmm_X, X))

            mice_pmm_lambda_reg_25 = MICE(impute_type='pmm',
                                          model=BayesianRidgeRegression(lambda_reg=0.25)).complete(X_corrupt)
            scores['MICE_pmm_lambda_reg_25'].append(evaluate(mice_pmm_lambda_reg_25, X))            

            mice_pmm_lambda_reg_10 = MICE(impute_type='pmm',
                                          model=BayesianRidgeRegression(lambda_reg=0.1)).complete(X_corrupt)
            scores['MICE_pmm_lambda_reg_10'].append(evaluate(mice_pmm_lambda_reg_10, X))

            mice_pmm_lambda_reg_1 = MICE(impute_type='pmm',
                                         model=BayesianRidgeRegression(lambda_reg=0.01)).complete(X_corrupt)
            scores['MICE_pmm_lambda_reg_1'].append(evaluate(mice_pmm_lambda_reg_1, X))

            mice_pmm_lambda_reg_01 = MICE(impute_type='pmm',
                                          model=BayesianRidgeRegression(lambda_reg=0.001)).complete(X_corrupt)
            scores['MICE_pmm_lambda_reg_01'].append(evaluate(mice_pmm_lambda_reg_01, X))

            mice_pmm_lambda_reg_001 = MICE(impute_type='pmm',
                                           model=BayesianRidgeRegression(lambda_reg=0.0001)).complete(X_corrupt)
            scores['MICE_pmm_lambda_reg_001'].append(evaluate(mice_pmm_lambda_reg_001, X))


            matrix_fact_X = MatrixFactorization().complete(X_corrupt)
            scores['MatrixFactor'].append(evaluate(matrix_fact_X, X))

            #nnm_X = NuclearNormMinimization().complete(X_corrupt)
            #scores['NuclearMin'].append(evaluate(nnm_X, X))

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

            knn_81_X = KNN(k=81).complete(X_corrupt)
            scores['knn_81'].append(evaluate(knn_81_X, X))

            knn_243_X = KNN(k=243).complete(X_corrupt)
            scores['knn_243'].append(evaluate(knn_243_X, X))

            knn_751_X = KNN(k=751).complete(X_corrupt)
            scores['knn_751'].append(evaluate(knn_751_X, X))

            knn_2000_X = KNN(k=2000).complete(X_corrupt)
            scores['knn_2000'].append(evaluate(knn_2000_X, X))

            knn_6000_X = KNN(k=6000).complete(X_corrupt)
            scores['knn_6000'].append(evaluate(knn_6000_X, X))

            if save_imputed:
                np.savetxt('./output/sweeps/' + name + '_MICE.csv',
                           mice_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_col_lambda_reg_25.csv',
                           mice_col_lambda_reg_25, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_col_lambda_reg_10.csv',
                           mice_col_lambda_reg_10, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_col_lambda_reg_1.csv',
                           mice_col_lambda_reg_1, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_col_lambda_reg_01.csv',
                           mice_col_lambda_reg_01, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_col_lambda_reg_001.csv',
                           mice_col_lambda_reg_001, delimiter=',', newline='\n')

                np.savetxt('./output/sweeps/' + name + '_mice_pmm_X.csv',
                           mice_pmm_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_pmm_lambda_reg_25.csv',
                           mice_pmm_lambda_reg_25, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_pmm_lambda_reg_10.csv',
                           mice_pmm_lambda_reg_10, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_pmm_lambda_reg_1.csv',
                           mice_pmm_lambda_reg_1, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_pmm_lambda_reg_01.csv',
                           mice_pmm_lambda_reg_01, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_mice_pmm_lambda_reg_001.csv',
                           mice_pmm_lambda_reg_001, delimiter=',', newline='\n')
                                
                np.savetxt('./output/sweeps/' + name + '_matrix_fact.csv',
                           matrix_fact_X, delimiter=',', newline='\n')
                
                np.savetxt('./output/sweeps/' + name + '_knn_1.csv',
                           knn_1_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_3.csv',
                           knn_3_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_9.csv',
                           knn_9_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_15.csv',
                           knn_15_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_30.csv',
                           knn_30_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_81.csv',
                           knn_81_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_243.csv',
                           knn_243_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_751.csv',
                           knn_751_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + '_knn_2000.csv',
                           knn_2000_X, delimiter=',', newline='\n')
                np.savetxt('./output/sweeps/' + name + 'knn_6000.csv',
                           knn_6000_X, delimiter=',', newline='\n')

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
                      skip_header=1)[:, 1:]
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
