#!/usr/bin/env python

from Pesticide_dataset_cleaner import Pesticide_dataset_cleaner

if __name__=='__main__':
    print('test_pesticide_cleaner.py is launched!!')

    inputFile = '../test_datasets/test_sample.txt'
    cleaned_pesticide = Pesticide_dataset_cleaner(inputFile)

