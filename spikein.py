import numpy as np


class MCAR():
    def spikein(self, X, rate):
        # @TODO there is definitely a more efficient way to do this
        for idx, row in enumerate(X):
            indices = np.random.random_integers(0, len(row) - 1,
                                                len(row) * rate)
            X[idx][indices] = np.nan
        return X
