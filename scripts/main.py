#! /usr/bin/env python

import argparse

from Dt_Cleaner_Factory_Producer import *

node_name = 'Dataset Cleaner'

if __name__=='__main__':
    # Getting arguments
    argParser = argparse.ArgumentParser( prog = node_name
                                       , description = 'This program is used to clean the inserted dataset according to the specified attributes')
    argParser.add_argument('input_dataset', help = 'The directory where the dataset can be found. It can be in txt or csv format.')
    argParser.add_argument('YAML_attribute_list', help = 'The XML in which contains the attributes wished to be kept. Only these attributes will be kept from the inserted dataset file.')
    argParser.add_argument('fromYear', help = 'Insert the year from which the rows are considered. Default = 1998', default = 1998)
    argParser.add_argument('toYear', help = 'Insert the year to which the rows are considered. Default = 2014', default= 2014)
    args = argParser.parse_args()

    inputDatasetFile = args.input_dataset
    attributeListYAML = args.YAML_attribute_list
    yearRangeTuple = (int(args.fromYear), int(args.toYear))

    print('{} is launched !!'.format(node_name))

    # Pesticide dataset cleaning
    factory_producer = Dt_Cleaner_Factory_Producer()
    # TODO: Allow user to switch dataset-cleaner type on runtime
    pest_factory = factory_producer.getFactory( CleanerFactoryType.PESTICIDE )
    pest_factory.getCleaner(inputDatasetFile, attributeListYAML, yearRangeTuple)