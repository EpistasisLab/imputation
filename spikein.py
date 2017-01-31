import numpy as np
import argparse
import h5py

# completely randomly spike in missingness
class MCAR():
    def spikein(self, X, rate):
        # @TODO there is definitely a more efficient way to do this
        for idx, row in enumerate(X):
            indices = np.random.random_integers(0, len(row) - 1,
                                                int(len(row) * rate))
            X[idx][indices] = np.nan
        return X

# replace based on value of another column
class MAR():
    def spikein(self, X, feature, quartile):
        f_vals = X[:, feature]
        low = np.percentile(f_vals, quartile*25)
        high = np.percentile(f_vals, (quartile+1)*25)

        quartile_vals = np.where(np.logical_and(f_vals>=low, f_vals < high))
        indices = np.random.random_integers(0, len(quartile_vals[0])-1,
                                            int(len(quartile_vals[0]*0.5)))
        f_vals[quartile_vals[0][indices]]  = np.nan

        print('MAR')
        return X

# replace 50% of highest or lowest values for a particular variable
class MNAR():
    def spikein(self, X, rate):
        print('MNAR')

def run(run_name='test', file_name='completeCasesBoxCox.csv'):
    X = load_file(file_name)

    # create MNAR

    # create MAR
    mar = MAR()
    for f in range(X.shape[1]):
        if f>3:
            # one trial per quartile
            for q in range(4):
                X_corrupt = mar.spikein(X.copy(), f, q)
                h5py.File('./data/spikein/MAR_' + str(f) + '_' + str(q), 'a')
            
    # create MCAR
    spike_rate = [0.1, 0.2, 0.3, 0.4, 0.5]
    trials = 10

    mcar = MCAR()
    for m in spike_rate:
        for t in range(trials):
            X_corrupt = mcar.spikein(X.copy(), m)
            h5py.File('./data/spikein/MCAR_' + str(m) + '_' + str(t), 'a')

def load_file(name):
    print(name)
    X = np.genfromtxt('./data/' + name + '.csv', delimiter=',',
                      skip_header=1)[:, 1:]
    print(X.shape)
    return X

if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("--name", type=str, default="test")
    parser.add_argument("--file_name", type=str, default="completeCasesBoxCox")

    args = parser.parse_args()

    run(args.name, args.file_name)
