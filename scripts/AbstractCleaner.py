#!/usr/bin/env python

import pandas as pd

from toDataFrameConverter import ToDataFrameConverter

class AbstractCleaner:
    def __init__(self, inputFile, attributeList):
        self.imported_dataset = ToDataFrameConverter(inputFile).getDataFrame()
        print('The received dataset has {} rows.'.format(self.imported_dataset.size))

        self.cleaned_dataset = self.imported_dataset[ attributeList ]
        self.outFile = self.setOutputFileName(inputFile, suffix = 'cleaned_dataset')
        self.saveAsCSVFile()

    def importCSVFile(self, inputCSVFile):
        return pd.read_csv( inputCSVFile )
    
    def setOutputFileName(self, inputCSVFile, suffix):
        return str(inputCSVFile) + '.' + str(suffix) + '.csv'
    
    def setTimeSpan(self, fromYear, toYear):
        pass
        # TODO

    def saveAsCSVFile(self):
        print('Output CSV file to {}'.format(self.outFile))
        self.cleaned_dataset.to_csv(self.outFile, index = False)
