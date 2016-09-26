# Package to Evaluate and Compare Imputation Techniques:

This package takes in a matrix, spikes-in missing data, imputes the missing values and evaluates the score.

Uses [fancyimpute](https://github.com/hammerlab/fancyimpute) and [scikit-learn](http://scikit-learn.org/stable/) for imputation methods.

### Inputs:
* Matrix X - Data
* Spike-in method - Method to add missingness to data
* Imputation methods - Imputation methods to evaluate
* Evaluation Method - Measures to evalute 

### Use run.py to perform evaluations:

> python run.py --name run --mode evaluate --data example.pkl --spike\_method mcar --spike\_rate 0.1 --imp\_methods all \-\-eval\_methods mse

Arguments:

* --name - name to save run results
* --mode - 
	* spike_in: spike in missingness and save the result
	* impute: impute the missing values and save the results 
	* evaluate: evaluate the accuracy of spiked in data
	* pipeline: spike in, impute, and evaluate the accuracy
	* sweep (@TODO): spike in, impute using specified methods and perform sweep to identify optimal parameters
* --data  - the filename of the data (from ./data/), this should be a pickled numpy array, where the first column are subject ids (@TODO this does not currently handle files with headers)
* --spike_in - the class name to use for spiking (options - mcar @TODO others)
* --spike_rate - float between 0 and 1
* --imputation_methods - 
	* all: runs all of the imputation methods
	* fast: runs all imputation methods except NuclearNormMinimization (@TODO others)
	* mean: mean column imputation (via scikit-learn)
	* median: median column imputation (via scikit-learn)
	* knn: k-nearest neighbors (@TODO handle k argument, uses fancyimpute) 
	* softimpute: Matrix completion by iterative soft thresholding of SVD decompositions (via fancyimpute)
	* iterativeSVD: Matrix completion by iterative low-rank SVD decomposition. (via Fancyimpute)
* --eval_methods - 
	* mse - mean squared error
	* ae - absolute error 
	* mape - mean absolute percentage error


@TODO

* Parameter Sweep
* Better handle parameters as input to imputers 