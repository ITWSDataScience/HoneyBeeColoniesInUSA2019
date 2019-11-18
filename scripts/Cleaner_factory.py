#! /usr/in/env/python

from Pesticide_dataset_cleaner import Pesticide_dataset_cleaner

class Cleaner_Factory:
    def __init__(self):
        pass

    def getCleaner(self, inputFile):
        '''
        This function serves as virtual function and needs to be overriden.
        '''
        pass