#! /usr/bin/env python

from Pesticide_Dt_Cleaer_Factory import Pesticide_Dt_Cleaner_Factory as pest_factory

if __name__=='__main__':
    print('test_Pesticide_Dt_Cleaner_Factory is launched!!')

    inputFile = '../test_datasets/test_sample.txt'

    print('Create factory...')
    pf = pest_factory()
    print('Done.')

    print('Get Cleaner')
    pf.getCleaner(inputFile)
    print('Done!')



