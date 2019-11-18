#! /usr/bin/env python

import yaml
import sys

class YAML_Parser:
    def __init__(self, inputYAML):
        self.yamlFile = inputYAML

    def getPythonList(self):
        with open( self.yamlFile, 'r') as in_file:
            try:
                return yaml.safe_load(in_file)
            except yaml.YAMLError as exc:
                print('YAML_Parser exception: {}'.format(exc) )
                sys.exit()