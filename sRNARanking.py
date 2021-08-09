import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i', '--input', help='Input data (feature table obtained by sRNACharP)',default=None,required=True,metavar='character')
parser.add_argument('-o', '--out', help='Filename to output predictions [default= outPredictions.txt]',default="outPredictions.txt",metavar='character')
args = parser.parse_args()

import pickle
random_forest_model = pickle.load(open("sRNARanking.sav", 'rb'))

import pandas

data = pandas.read_table(args.input, index_col=0)
probability_predictions = random_forest_model.predict_proba(data)
output_data = {"No sRNA": probability_predictions[:, 0], "sRNA": probability_predictions[:, 1]}

# Creates pandas DataFrame.
output_data_table = pandas.DataFrame(output_data, index=data.index)
output_data_table = output_data_table.round(4)
output_data_table.to_csv(args.out,sep="\t")


