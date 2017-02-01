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
    X[~np.isnan(X)] = 1
    X[np.isnan(X)] = 0

    if col > 0:
        y = X[:, col]
        X = np.delete(X, col, axis=1)

    cv = StratifiedKFold(y, n_folds=10, random_state=123, shuffle=True)
    scores = []

    print(np.unique(y, return_counts=True))

    for i, (train, test) in enumerate(cv):
        clf = SGDClassifier(loss="hinge", penalty="l2")
        clf.fit(X[train], y[train])
        scores.append(roc_auc_score(y[test], clf.predict(X[test])))

        # rfc = RandomForestClassifier(n_jobs=-1, class_weight="balanced")
        # rfc.fit(X[train], y[train])
        #
        # scores.append(roc_auc_score(y[test], rfc.predict(X[test])))

    print(scores)
    pkl.dump(scores, open('data/spikein/' + '_scores.p', 'w'))


if __name__ == "__main__":
    for filename in os.listdir('data/spikein'):
        if filename != '.DS_Store' and 'scores' not in filename:
            if filename.startswith('MCAR'):
                continue
                # col = 0
                # quartile = 0
            elif filename.startswith('MAR'):
                col = int(filename.split('_')[1])
            else:
                col = int(filename.split('_')[2])
            print(filename)
            print(col)
            f = h5py.File('./data/spikein/' + filename, 'r')
            X = f['dataset'][:]
            run_predict(filename, X, col)
