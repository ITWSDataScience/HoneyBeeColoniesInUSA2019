#! /usr/bin/env python

import pandas as pd

from AbstractCleaner import AbstractCleaner
from YAML_parser import YAML_Parser as yamlp

class Pesticide_dataset_cleaner(AbstractCleaner):
    def __init__(self, inputFile, attribFile, timeRange):
        '''
        @brief The derived class of AbstractCleaner. The only difference to the inherited
        abstract clss is that this one convert the YAML file's content to its Python list.
        This used to be dedicated to cleaning the pesticide dataset, but I found out that 
        it can serve as a general purpose database cleaner.
        TODO: Change the name of this class to "generic cleaner" or namesake of some sort

        @inputFile: The input CSV or TXT file in which the dataset is stored
        @attribFile: The YAML file in which the attributes wished to be kept are stored
        @timeRange: The tuple in the form (fromYear, toYear)
        '''

        # Get attribute list
        attributeList = yamlp(attribFile).getPythonList()

        AbstractCleaner.__init__(self, inputFile, attributeList, timeRange)
