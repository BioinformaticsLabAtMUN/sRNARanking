# sRNARanking
Random Forest classifier to rank nucleotide sequences based on their likelihood to be bona fide bacterial sRNAs.

## Requirements

Python (version 3.8) with the libraries pickle, argparse and pandas installed. 

## Usage
The script takes as input a feature table generated by [sRNACharP](https://github.com/bioinformaticslabatmun/sRNACharP) and outputs the probability of each sequence being a bona fine sRNA or not as calculated by a Random Forest classifier.

Launching the pipeline from the terminal with the `-h ` parameter as shown below:
```
python sRNARanking.py -h
```

shows the help message:
```
usage: sRNARanking.py [-h] -i character [-o character]

optional arguments:
  -h, --help            show this help message and exit
  -i character, --input character
                        Input data (feature table obtained by sRNACharP)
  -o character, --out character
                        Filename to output predictions [default= outPredictions.txt]
```

To run the script,  you need to specify the sRNACharP-generated input feature table (required) and the filename of the output file (optional). A sample [feature table](FeatureTable.tsv) is provided. To run this script with the test data, just type on your terminal the command shown below (make sure that the feature table, the sav file, and the python script are all in the working directory):

```
python sRNARanking.py -i FeatureTable.tsv -o outFile.txt
```

## Output

The output file consists of three columns:  putative sRNA ID,  probability of not being a sRNA, and  probability of being a sRNA (third column). Note that per each putative sRNA the probability at the 2nd column + the probability at the 3rd column equals to 1. The output file only contains two column labels: one for the 2nd column and one for the third column.

Empirically we found that the minimum probability threshold to deem a sequence a likely sRNA and obtain a precision above 0.5 is 0.4 in the third column. Take into account that setting a higher minimum probability threshold of being a sRNA will increase the precision of the results.

## Citing
If you use this script, please cite:

Eppenhof EJ, Peña-Castillo L. (2019) [Prioritizing bona fide bacterial small RNAs with machine learning classifiers. PeerJ 7:e6304](https://doi.org/10.7717/peerj.6304)
