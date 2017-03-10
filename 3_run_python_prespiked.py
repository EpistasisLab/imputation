import pickle as pkl
import numpy as np
import argparse
import h5py
import math
import pandas as pd

from sklearn.preprocessing import Imputer
from fancyimpute import (SimpleFill, KNN, SoftImpute, IterativeSVD,
                         MICE, MatrixFactorization,
                         NuclearNormMinimization, BiScaler)
from fancyimpute.bayesian_ridge_regression import BayesianRidgeRegression


def run(folder, name, patients, run_all, save_imputed):
    random_seed = 123
    np.random.seed(seed=random_seed)

    X_corrupt = load_file(folder, name)
    name = name.split('.csv')[0]
    print(name)

    end = X_corrupt.shape[0]
    print(end)
    X = np.genfromtxt('./data/completeCasesBoxCox.csv', delimiter=',',
                      skip_header=1)[:end, 1:]

    scores = {}
    simple_mean_X = SimpleFill(fill_method='mean').complete(X_corrupt)
    scores['simple_mean'] = evaluate(simple_mean_X, X, X_corrupt)

    simple_median_X = SimpleFill(fill_method='median').complete(X_corrupt)
    scores['simple_median'] = evaluate(simple_median_X, X, X_corrupt)

    random_X = SimpleFill(fill_method='random').complete(X_corrupt)
    scores['random'] = evaluate(random_X, X, X_corrupt)

    # SVD
    svd_1_X = IterativeSVD(rank=1).complete(X_corrupt)
    scores['svd_1'] = evaluate(svd_1_X, X, X_corrupt)

    svd_2_X = IterativeSVD(rank=2).complete(X_corrupt)
    scores['svd_2'] = evaluate(svd_2_X, X, X_corrupt)

    svd_3_X = IterativeSVD(rank=3).complete(X_corrupt)
    scores['svd_3'] = evaluate(svd_3_X, X, X_corrupt)

    svd_4_X = IterativeSVD(rank=4).complete(X_corrupt)
    scores['svd_4'] = evaluate(svd_4_X, X, X_corrupt)

    svd_5_X = IterativeSVD(rank=5).complete(X_corrupt)
    scores['svd_5'] = evaluate(svd_5_X, X, X_corrupt)

    svd_6_X = IterativeSVD(rank=6).complete(X_corrupt)
    scores['svd_6'] = evaluate(svd_6_X, X, X_corrupt)

    svd_7_X = IterativeSVD(rank=7).complete(X_corrupt)
    scores['svd_7'] = evaluate(svd_7_X, X, X_corrupt)

    svd_8_X = IterativeSVD(rank=8).complete(X_corrupt)
    scores['svd_8'] = evaluate(svd_8_X, X, X_corrupt)

    svd_9_X = IterativeSVD(rank=9).complete(X_corrupt)
    scores['svd_9'] = evaluate(svd_9_X, X, X_corrupt)

    svd_10_X = IterativeSVD(rank=10).complete(X_corrupt)
    scores['svd_10'] = evaluate(svd_10_X, X, X_corrupt)

    svd_11_X = IterativeSVD(rank=11).complete(X_corrupt)
    scores['svd_11'] = evaluate(svd_11_X, X, X_corrupt)

    svd_12_X = IterativeSVD(rank=12).complete(X_corrupt)
    scores['svd_12'] = evaluate(svd_12_X, X, X_corrupt)

    svd_13_X = IterativeSVD(rank=13).complete(X_corrupt)
    scores['svd_13'] = evaluate(svd_13_X, X, X_corrupt)

    svd_14_X = IterativeSVD(rank=14).complete(X_corrupt)
    scores['svd_14'] = evaluate(svd_14_X, X, X_corrupt)

    svd_15_X = IterativeSVD(rank=15).complete(X_corrupt)
    scores['svd_15'] = evaluate(svd_15_X, X, X_corrupt)

    svd_16_X = IterativeSVD(rank=16).complete(X_corrupt)
    scores['svd_16'] = evaluate(svd_16_X, X, X_corrupt)

    svd_17_X = IterativeSVD(rank=17).complete(X_corrupt)
    scores['svd_17'] = evaluate(svd_17_X, X, X_corrupt)

    svd_18_X = IterativeSVD(rank=18).complete(X_corrupt)
    scores['svd_18'] = evaluate(svd_18_X, X, X_corrupt)

    svd_19_X = IterativeSVD(rank=19).complete(X_corrupt)
    scores['svd_19'] = evaluate(svd_19_X, X, X_corrupt)

    svd_20_X = IterativeSVD(rank=20).complete(X_corrupt)
    scores['svd_20'] = evaluate(svd_20_X, X, X_corrupt)

    svd_21_X = IterativeSVD(rank=21).complete(X_corrupt)
    scores['svd_21'] = evaluate(svd_21_X, X, X_corrupt)

    svd_22_X = IterativeSVD(rank=22).complete(X_corrupt)
    scores['svd_22'] = evaluate(svd_22_X, X, X_corrupt)

    svd_23_X = IterativeSVD(rank=23).complete(X_corrupt)
    scores['svd_23'] = evaluate(svd_23_X, X, X_corrupt)

    svd_24_X = IterativeSVD(rank=24).complete(X_corrupt)
    scores['svd_24'] = evaluate(svd_24_X, X, X_corrupt)

    si_X = SoftImpute().complete(X_corrupt)
    scores['si'] = evaluate(si_X, X, X_corrupt)

    si_s_half_X = SoftImpute(shrinkage_value=0.5).complete(X_corrupt)
    scores['si_s_half'] = evaluate(si_s_half_X, X, X_corrupt)

    si_s_1_X = SoftImpute(shrinkage_value=1).complete(X_corrupt)
    scores['si_s_1'] = evaluate(si_s_1_X, X, X_corrupt)

    si_s_2_X = SoftImpute(shrinkage_value=2).complete(X_corrupt)
    scores['si_s_2'] = evaluate(si_s_2_X, X, X_corrupt)

    si_s_4_X = SoftImpute(shrinkage_value=4).complete(X_corrupt)
    scores['si_s_4'] = evaluate(si_s_4_X, X, X_corrupt)

    si_s_8_X = SoftImpute(shrinkage_value=8).complete(X_corrupt)
    scores['si_s_8'] = evaluate(si_s_8_X, X, X_corrupt)

    si_s_16_X = SoftImpute(shrinkage_value=16).complete(X_corrupt)
    scores['si_s_16'] = evaluate(si_s_16_X, X, X_corrupt)

    si_s_32_X = SoftImpute(shrinkage_value=32).complete(X_corrupt)
    scores['si_s_32'] = evaluate(si_s_32_X, X, X_corrupt)

    si_s_64_X = SoftImpute(shrinkage_value=64).complete(X_corrupt)
    scores['si_s_64'] = evaluate(si_s_64_X, X, X_corrupt)

    si_s_128_X = SoftImpute(shrinkage_value=128).complete(X_corrupt)
    scores['si_s_128'] = evaluate(si_s_128_X, X, X_corrupt)

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
        scores['MICE'] = evaluate(mice_X, X, X_corrupt)

        mice_col_lambda_reg_25 = MICE(
            model=BayesianRidgeRegression(lambda_reg=0.25)).complete(X_corrupt)
        scores['MICE_col_lambda_reg_25'] = evaluate(
            mice_col_lambda_reg_25, X, X_corrupt)

        mice_col_lambda_reg_10 = MICE(
            model=BayesianRidgeRegression(lambda_reg=0.1)).complete(X_corrupt)
        scores['MICE_col_lambda_reg_10'] = evaluate(
            mice_col_lambda_reg_10, X, X_corrupt)

        mice_col_lambda_reg_1 = MICE(
            model=BayesianRidgeRegression(lambda_reg=0.01)).complete(X_corrupt)
        scores['MICE_col_lambda_reg_1'] = evaluate(
            mice_col_lambda_reg_1, X, X_corrupt)

        mice_col_lambda_reg_01 = MICE(
            model=BayesianRidgeRegression(lambda_reg=0.001)).complete(X_corrupt)
        scores['MICE_col_lambda_reg_01'] = evaluate(
            mice_col_lambda_reg_01, X, X_corrupt)

        mice_col_lambda_reg_001 = MICE(
            model=BayesianRidgeRegression(lambda_reg=0.0001)).complete(X_corrupt)
        scores['MICE_col_lambda_reg_001'] = evaluate(
            mice_col_lambda_reg_001, X, X_corrupt)

        mice_pmm_X = MICE(impute_type='pmm').complete(X_corrupt)
        scores['MICE_pmm'] = evaluate(mice_pmm_X, X, X_corrupt)

        mice_pmm_lambda_reg_25 = MICE(
            impute_type='pmm',
            model=BayesianRidgeRegression(lambda_reg=0.25)).complete(X_corrupt)
        scores['MICE_pmm_lambda_reg_25'] = evaluate(
            mice_pmm_lambda_reg_25, X, X_corrupt)

        mice_pmm_lambda_reg_10 = MICE(
            impute_type='pmm',
            model=BayesianRidgeRegression(lambda_reg=0.1)).complete(X_corrupt)
        scores['MICE_pmm_lambda_reg_10'] = evaluate(
            mice_pmm_lambda_reg_10, X, X_corrupt)

        mice_pmm_lambda_reg_1 = MICE(
            impute_type='pmm',
             model=BayesianRidgeRegression(lambda_reg=0.01)).complete(X_corrupt)
        scores['MICE_pmm_lambda_reg_1'] = evaluate(mice_pmm_lambda_reg_1, X, X_corrupt)

        mice_pmm_lambda_reg_01 = MICE(
            impute_type='pmm',
            model=BayesianRidgeRegression(lambda_reg=0.001)).complete(X_corrupt)
        scores['MICE_pmm_lambda_reg_01'] = evaluate(mice_pmm_lambda_reg_01, X, X_corrupt)

        mice_pmm_lambda_reg_001 = MICE(
            impute_type='pmm',
            model=BayesianRidgeRegression(lambda_reg=0.0001)).complete(X_corrupt)
        scores['MICE_pmm_lambda_reg_001'] = evaluate(
            mice_pmm_lambda_reg_001, X, X_corrupt)

        knn_1_X = KNN(k=1).complete(X_corrupt)
        scores['knn_1'] = evaluate(knn_1_X, X, X_corrupt)

        knn_3_X = KNN(k=3).complete(X_corrupt)
        scores['knn_3'] = evaluate(knn_3_X, X, X_corrupt)

        knn_9_X = KNN(k=9).complete(X_corrupt)
        scores['knn_9'] = evaluate(knn_9_X, X, X_corrupt)

        knn_15_X = KNN(k=15).complete(X_corrupt)
        scores['knn_15'] = evaluate(knn_15_X, X, X_corrupt)

        knn_30_X = KNN(k=30).complete(X_corrupt)
        scores['knn_30'] = evaluate(knn_30_X, X, X_corrupt)

        knn_81_X = KNN(k=81).complete(X_corrupt)
        scores['knn_81'] = evaluate(knn_81_X, X, X_corrupt)

        knn_243_X = KNN(k=243).complete(X_corrupt)
        scores['knn_243'] = evaluate(knn_243_X, X, X_corrupt)

        knn_751_X = KNN(k=751).complete(X_corrupt)
        scores['knn_751'] = evaluate(knn_751_X, X, X_corrupt)

        knn_2000_X = KNN(k=2000).complete(X_corrupt)
        scores['knn_2000'] = evaluate(knn_2000_X, X, X_corrupt)

        knn_6000_X = KNN(k=6000).complete(X_corrupt)
        scores['knn_6000'] = evaluate(knn_6000_X, X, X_corrupt)

        if save_imputed:
            np.savetxt('./output/sweeps/' + name + '_MICE.csv',
                       mice_X, delimiter=',', newline='\n')
            np.savetxt('./output/sweeps/' + name +
                       '_mice_col_lambda_reg_25.csv',
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
    scores_df = pd.DataFrame().from_dict(scores.items())
    scores_df.columns = ['Method', 'Score']
    scores_df.set_index('Method')
    scores_df.to_csv('./output/scores/' + name + '.csv')


def evaluate(X_imputed, X, X_corrupt, method='rmse'):
    if method == 'rmse':
        impute_count = np.count_nonzero(np.isnan(X_corrupt))
        X = np.nan_to_num(X)
        X_imputed = np.nan_to_num(X_imputed)

        #rmse = math.sqrt(((X - X_imputed) ** 2).sum(axis=None)/impute_count)
        rmse = math.sqrt(((X - X_imputed) ** 2).mean(axis=None))
        return rmse


def load_file(folder, name):
    print(name)
    X = np.genfromtxt('./data/spikeincsv/' + folder + '/' + name,
                      delimiter=',')
    print(X.shape)
    return X


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--folder", type=str)
    parser.add_argument("--name", type=str)
    parser.add_argument("--patients", type=int)
    parser.add_argument("--run_all", type=int, default=0)
    parser.add_argument("--save_imputed", type=int, default=0)

    args = parser.parse_args()
    args.name = args.name.split('/')[-1]
    run(args.folder, args.name, args.patients, args.run_all, args.save_imputed)
