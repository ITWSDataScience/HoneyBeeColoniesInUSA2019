#! /usr/bin/env python

from enum import Enum

from Pesticide_Dt_Cleaer_Factory import Pesticide_Dt_Cleaner_Factory as pdcf
# Other dataset cleaner factories go here

class CleanerFactoryType(Enum):
    PESTICIDE = 1
    POPULATION = 2
    PRICE = 3

class Dt_Cleaner_Factory_Producer():
    def getFactory(self, factoryType):
        if factoryType is CleanerFactoryType.PESTICIDE:
            return pdcf()
        elif factoryType is CleanerFactoryType.POPULATION:
            pass
        elif factoryType is CleanerFactoryType.PRICE:
            pass
        else:
            print('The inserted factory does type does not exist.')
    