#! /usr/bin/env python

import pandas as pd

from AbstractCleaner import AbstractCleaner

class Pesticide_dataset_cleaner(AbstractCleaner):
    def __init__(self, inputFile):
        # Get attribute list
        attributeList = [ 'State'
                        , 'Compound'
                        , 'Year'
                        , 'Units']

        AbstractCleaner.__init__(self, inputFile, attributeList)

