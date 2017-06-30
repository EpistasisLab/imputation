import numpy as np
import pandas as pd
import os
import h5py
import pickle as pkl

from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import SGDClassifier
from sklearn import svm
from sklearn.cross_validation import StratifiedKFold
from sklearn.metrics import confusion_matrix
import itertools
from sklearn.metrics import roc_auc_score

from pandas import compat
compat.PY3 = True


def run_predict(filename, X, col):
    print(filename, col)
    print(type(X))
    print(X.shape)
    scores = []
    y = X[col].as_matrix()

    X = X.drop(col, axis=1)
    X_copy = X.as_matrix()
    y[~np.isnan(y)] = 1
    y[np.isnan(y)] = 0

    X_copy[np.isnan(X_copy)] = 0

    cv = StratifiedKFold(y, n_folds=10, random_state=123, shuffle=True)

    for i, (train, test) in enumerate(cv):
        rfc = RandomForestClassifier(n_jobs=-1,
                                     class_weight="balanced")
        rfc.fit(X_copy[train], y[train])
        scores.append(roc_auc_score(y[test], rfc.predict(X_copy[test])))
        print(i, scores)

    return scores

if __name__ == "__main__":
    X = pd.read_csv('./data/all_patients_all_labs.csv')
    print(X.columns)

    lab_matrix = pd.read_csv('./data/labPanelMembershipMatrix.txt',
                             delimiter='\t')
    lab_matrix.set_index("NA", inplace=True)

    all_patients_scores = {}

    # only keep the first value in each panel

    for p in lab_matrix:
        print(p)

        cols = lab_matrix.loc[lab_matrix[p] == 1].index
        cols = cols.drop(p)

        X_no_panel = X.drop(cols, axis=1)
        all_patients_scores[p] = run_predict('all_patients', X_no_panel, p)

        pkl.dump(all_patients_scores, open('data/all_patients_' +
                                           'all_panel_scores.p', 'w+'))
