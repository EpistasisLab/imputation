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


def run_predict(filename, X):
    scores_dict = {}
    print(type(X))
    print(X[:4])
    print(X.shape)
    for col in range(X.shape[1]):
        if col > 2:
            y = X[:, col]
            X_copy = X.copy()
            X_copy = np.delete(X, col, axis=1)

            y[~np.isnan(y)] = 1
            y[np.isnan(y)] = 0

            X_copy[np.isnan(X_copy)] = 0

            cv = StratifiedKFold(y, n_folds=10, random_state=123, shuffle=True)
            scores_dict[col] = {}

            scores_dict[col]['sgd'] = []
            scores_dict[col]['rfc'] = []

            print(np.unique(y, return_counts=True))

            for i, (train, test) in enumerate(cv):
                clf = SGDClassifier(loss="hinge", penalty="l2")
                clf.fit(X_copy[train], y[train])
                scores_dict[col]['sgd'].append(roc_auc_score(y[test],
                                               clf.predict(X_copy[test])))

                rfc = RandomForestClassifier(n_jobs=-1,
                                             class_weight="balanced")
                rfc.fit(X_copy[train], y[train])
                scores_dict[col]['rfc'].append(roc_auc_score(y[test],
                                               rfc.predict(X_copy[test])))

    print(scores_dict)
    pkl.dump(scores_dict, open('data/all_patients/' + filename + '_all_scores.p',
                               'w'))


if __name__ == "__main__":
    X = pd.read_csv('./data/all_patients_all_labs.csv')
    X = X.as_matrix()
    run_predict('all_patients', X)
