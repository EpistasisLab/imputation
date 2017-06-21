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
            # clf = SGDClassifier(loss="hinge", penalty="l2")
            # clf.fit(X_copy[train], y[train])
            # scores_dict[col]['sgd'].append(roc_auc_score(y[test],
            #                                clf.predict(X_copy[test])))

            rfc = RandomForestClassifier(n_jobs=-1,
                                         class_weight="balanced")
            rfc.fit(X_copy[train], y[train])
            scores_dict[col]['rfc'].append(roc_auc_score(y[test],
                                           rfc.predict(X_copy[test])))
            print(i, scores_dict)

    print(scores_dict)
    pkl.dump(scores_dict, open('data/all_patients/' + filename +
                               '_panel_scores.p', 'w'))

if __name__ == "__main__":
    X = pd.read_csv('./data/all_patients_all_labs.csv')

    # only keep the first value in each panel
    panel = ["751-8", "1743-4", "10466-1", "20565-8", "2708-6", "1925-7",
             "19994-3", "1990-1", "2157-6", "12187-1", "6303-2", "3181-5",
             "27811-9", "27818-4", "27822-6", "13982-4", "2064-4", "3167-4",
             "2888-6", "28009-9", "2132-9", "2284-8", "2965-2", "18262-6",
             "2857-1", "30934-4", "33762-6", "10535-3", "3026-2", "1834-1",
             "21198-7", "3024-7", "3051-0", "11572-5", "29958-6", "13964-2",
             "13965-9", "30522-7", "1763-2", "2143-6", "5206-8", "20448-7",
             "11580-8", "2742-5", "1986-9", "1798-8", "20563-3", "17862-4",
             "1825-9", "10330-9", "23860-0", "2340-8", "3255-7", "17849-1",
             "1988-5", "10886-0", "20437-0", "13967-5", "2986-8", "2991-8",
             "10501-5", "20433-9", "2243-4", "2571-8", "14957-5", "17856-6",
             "27353-2", "72586-1", "2465-3", "2458-8", "763-3", "740-1",
             "2731-8", "2276-4", "2502-3", "53115-2", "10334-1", "2039-6",
             "1968-7", "14338-8", "19123-9", "2324-2", "2777-1", "12180-6",
             "14804-9", "3084-1"]
    X = X[panel]
    X = X.as_matrix()
    run_predict('all_patients', X)
