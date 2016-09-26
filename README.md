# Package to Evaluate and Compare Imputation Techniques:

This package takes in a matrix, spikes-in missing data, imputes the missing values and evaluates the score.

Uses [fancyimpute](https://github.com/hammerlab/fancyimpute) and [scikit-learn](http://scikit-learn.org/stable/) for imputation methods.

### Inputs:
* Matrix X - Data
* Spike-in method - Method to add missingness to data
* Evaluation Method - Measures to evalute 

### Use run.py to perform evaluations:

> python run.py --name run --mode evaluate --data example.pkl --spike\_in MCAR --missing\_rate 0.1 --trials 1 \-\-eval\_method mse

Arguments:

* --name - name to save run results
* --data  - the filename of the data (from ./data/), this should be a pickled numpy array, where the first column are subject ids (@TODO this does not currently handle files with headers)
* --spike_in - the class name to use for spiking (options - mcar @TODO others)
* --missing_rate - list of floats between 0 and 1 (amount to spike in)
* --trials - the number of trials to run for each 
* --eval_methods - 
	* mse - mean squared error
	* ae - absolute error 
	* mape - mean absolute percentage error

@TODO
* Parameter Sweep
* Better handle parameters as input to imputers 