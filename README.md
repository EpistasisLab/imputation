# Package to Evaluate and Compare Imputation Techniques:

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
	* impute: impute the missing values and save the results, 
	* evaluate: spike in, impute and evaluate the accuracy, 
	* sweep (@TODO): spike in, impute using specified methods and perform sweep to identify optimal parameters
* --data  - the filename of the data (from ./data/), this should be a pickled numpy array, where the first column are subject ids (@TODO this does not currently handle files with headers)
* --spike_in - the class name to use for spiking (options - mcar @TODO others)
* --imputation_methods - 
	* all: runs all of the imputation methods
	* fast: runs all imputation methods except NuclearNormMinimization (@TODO others)
	* knn: k-nearest neighbors (@TODO handle k argument, uses fancyimpute) 
	* 	

