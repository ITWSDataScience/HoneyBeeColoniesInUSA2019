#! /usr/bin/env python

from Dt_Cleaner_Factory_Producer import *

if __name__=='__main__':
    print('test_Dt_Cleaner_Factory_Producer is launched!')

    switch = Dt_Cleaner_Factory_Producer()

    print('About to choose pesticide dataset cleaner')
    Pest_factory = switch.getFactory( CleanerFactoryType.PESTICIDE )

    