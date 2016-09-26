import argparse
import importlib
import os
import pickle as pkl

# os.environ["THEANO_FLAGS"] = "device=gpu%d" % random.randint(0, 1)
os.environ["THEANO_FLAGS"] = "device=cpu"


def spike_in(X, method, rate):
    spiker = importlib.import_module("spike." + method)
    return spiker(X, rate)


def impute(methods):
    imputed_dict = {}
    for imp in methods:
        imputer = importlib.import_module("imputer." + method)
        imputed_dict[imp] = imputer.impute(imp)
    return imputed_dict


def evaluate()


def load_data(path):
    X = pkl.load(open('./data/' + path, 'rb'))
    return X


def save_results(name, save_dict):
    path = './data/' + name

    if not.os.path.exists(path):
        os.makedirs(path)

    # @TODO run details
    if 'spiked_in' in save_dict:
        pkl.dump(save_dict['spiked_in'], open(path + 'spiked_in.p', 'wb'))

    if 'imputed' in save_dict:

        pkl.dump(save_dict['imputed'], open(path + 'imputed.p', 'wb'))

    if 'scores' in save_dict:
        pkl.dump(save_dict['scores'], open(path + 'scores.p', 'wb'))


def get_args():
    parser = argparse.ArgumentParser()

    # name of run
    parser.add_argument("--name", type=str)

    # mode
    parser.add_argument("--mode", type=str)

    # data input file (file name in ./data)
    parser.add_argument("--data", type=str)

    # type of spike in to use and percentage
    parser.add_argument("--spike_method", type=str)
    parser.add_argument("--spike_ratio", type=float, default=0.2)

    # imputation methods
    parser.add_argument("--imp_methods", type=str, default="all", nargs="*")

    # evaluate scores
    parser.add_argument("--eval_methods", type=str, default="mse")

    args = parser.parse_args()
    return args

if __name__ == "__main__":
    args = get_args()

    X = load_data(args.path)
    save_dict = {}

    if (args.mode == 'spike_in'):
        print('spike in')
        save_dict['spiked_in'] = spike_in(X, args.spike_method,
                                          args.spike_ratio)

    if (args.mode == 'impute'):
        print('impute')
        save_dict['imputed'] = impute(X_incomplete, args.imp_methods)

    if (args.mode == 'evaluate'):
        print('evaluate')
        save_dict['evaluate'] = evaluate(imputed_X_dict)

    if (args.mode == 'sweep'):
        raise Exception('Not Implemented')

    save_results(args.name, save_dict)
