#!/usr/bin/env Rscript
library("optparse")
library(randomForest)

option_list = list(
  make_option(c("-i", "--input"), type="character", default=NULL, 
              help="Input data (feature table obtained by sRNACharP)", metavar="character"),
  make_option(c("-o", "--out"), type="character", default="outPredictions.txt", 
              help="Filename to output predictions [default= %default]", metavar="character")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$input)){
  print_help(opt_parser)
  stop("At least the input data filename must be provided", call.=FALSE)
}

RF <- readRDS("RF_classifier4sRNA.rds")
data <- read.table(opt$input, sep = "\t", header = TRUE)

pred <- predict(RF, data, type = "prob")
colnames(pred) <- c("No sRNA", "sRNA")
write.table(pred, file = opt$out, sep = "\t", col.names = TRUE, row.names = TRUE)
