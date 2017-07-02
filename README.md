# Characterizing and Managing Missing Structured Data in Electronic Health Records:

Brett K. Beaulieu-Jones<sup>1,2</sup>, Daniel Lavage<sup>3</sup>, John Snyder<sup>3</sup>, Jason H. Moore<sup>2</sup>, Sarah A Pendergrass<sup>3</sup>, Christopher R. Bauer<sup>3,*</sup>

<sup>1</sup> Genomics and Computational Biology Graduate Group, Perelman School of Medicine, University of Pennsylvania, Philadelphia, Pennsylvania, USA.<sup>2</sup> Institute for Biomedical Informatics, University of Pennsylvania, Philadelphia, PA 19104<sup>3</sup> Biomedical and Translational Informatics Institute, Geisinger Health System*To whom correspondence should be addressed: (cbauer) at geisinger.edu

Introduction
--------

Missing data is a challenge for all studies; however, this is especially true for electronic health record (EHR) based analyses.  Failure to appropriately consider missing data can lead to biased results.  Here, we are detailed procedures for when and how to conduct imputation of EHR data.  We demonstrate how the mechanism of missingness can be assessed, evaluate the performance of a variety of imputation methods, and describe some of the most frequent problems that can be encountered.  

We used three opensource libraries for comparison and evaluation:

1. [fancyimpute](https://github.com/hammerlab/fancyimpute)

2. [scikit-learn](http://scikit-learn.org/stable/)
 
3. [Multivariate Imputation by Chained Equations - R](https://github.com/stefvanbuuren/mice)



Feedback
--------

Please feel free to email us - (brettbe) at med.upenn.edu with any feedback or
raise a github issue with any comments or questions.

Acknowledgements
----------------

We thank Casey S. Greene (University of Pennsylvania) for his helpful discussions. Funding: This work was supported by the Commonwealth Universal Research Enhancement (CURE) Program grant from the Pennsylvania Department of Health. B.K.B.-J. and J.H.M. were also supported by  and by US National Institutes of Health grants AI116794 and LM010098 to J.H.M.. 