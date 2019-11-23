#! /usr/bin/env python

import pandas as pd

from AbstractCleaner import AbstractCleaner
from YAML_parser import YAML_Parser as yamlp

class Pesticide_dataset_cleaner(AbstractCleaner):
    def __init__(self, inputFile, attribFile, timeRange):
        # Get attribute list
        attributeList = yamlp(attribFile).getPythonList()

        AbstractCleaner.__init__(self, inputFile, attributeList, timeRange)
