#! /usr/bin/env python

from Cleaner_factory import Cleaner_Factory
from Pesticide_dataset_cleaner import Pesticide_dataset_cleaner as pdc

class Pesticide_Dt_Cleaner_Factory(Cleaner_Factory):
    def __init__(self):
        Cleaner_Factory.__init__(self)
    
    def getCleaner(self, inputFile):
        return pdc(inputFile)