import numpy as np
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


def run_predict(filename, X, col):
    if col > 0:
        y = X[:, col]
        X = np.delete(X, col, axis=1)

        y[~np.isnan(y)] = 1
        y[np.isnan(y)] = 0

        cv = StratifiedKFold(y, n_folds=10, random_state=123, shuffle=True)
        scores_dict = {}
        scores_dict['sgd'] = []
        scores_dict['rfc'] = []

        print(np.unique(y, return_counts=True))

        for i, (train, test) in enumerate(cv):
            clf = SGDClassifier(loss="hinge", penalty="l2")
            clf.fit(X[train], y[train])
            scores_dict['sgd'].append(roc_auc_score(y[test],
                                      clf.predict(X[test])))

            rfc = RandomForestClassifier(n_jobs=-1, class_weight="balanced")
            rfc.fit(X[train], y[train])
            scores_dict['rfc'].append(roc_auc_score(y[test],
                                      rfc.predict(X[test])))

        print(scores_dict)
        pkl.dump(scores_dict, open('data/spikein/' + filename +
                 '_vals_scores.p', 'w'))


def run_mcar_predict(filename, X):
    scores_dict = {}
    print(type(X))
    print(X[:4])
    print(X.shape)
    for col in range(X.shape[1]):
        if col > 3:
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
    pkl.dump(scores_dict, open('data/spikein/' + filename + '_vals_scores.p',
                               'w'))


if __name__ == "__main__":
    i = 0
    for filename in os.listdir('data/spikein'):
        if filename != '.DS_Store' and 'scores' not in filename:
            i += 1

            f = h5py.File('./data/spikein/' + filename, 'r')
            X = f['dataset'][:]

            if filename.startswith('MCAR'):
                run_mcar_predict(filename, X)
            # else:
            #     if filename.startswith('MAR'):
            #         col = int(filename.split('_')[1])
            #     else:
            #         col = int(filename.split('_')[2])
            #     print(str(i) + ' ' + filename)
            #     print(col)
            #     run_predict(filename, X, col)
