#! /usr/bin/env python

from YAML_parser import YAML_Parser

if __name__=='__main__':
    print('test_YAML_Parser is launched !!')

    inputYAMLFile = '../test_datasets/test.yaml'
    parser = YAML_Parser(inputYAMLFile)

    print( parser.getPythonObject() )

    dummyList = parser.getPythonObject()

    for i in range( len(dummyList) ):
        print('[{}]: {}'.format(i, dummyList[i]))