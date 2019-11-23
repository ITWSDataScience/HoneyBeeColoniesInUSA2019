#!/usr/bin/env python

import pandas as pd

from toDataFrameConverter import ToDataFrameConverter

class AbstractCleaner:
    def __init__(self, inputFile, attributeList, timeRangeTuple, timeFrameAttrib = 'Year'):
        self.imported_dataset = ToDataFrameConverter(inputFile).getDataFrame()
        print('The received dataset has {} elements.'.format(self.imported_dataset.size))

        self.cleaned_dataset = self.imported_dataset[ attributeList ]

        # Only keep rows that fall in the time range
        fromYear, toYear = timeRangeTuple
        self.cleaned_dataset = self.setTimeSpan(self.cleaned_dataset, timeFrameAttrib, fromYear, toYear)

        self.outFile = self.setOutputFileName(inputFile, suffix = 'cleaned_dataset')
        self.saveAsCSVFile( self.outFile )

    def importCSVFile(self, inputCSVFile):
        return pd.read_csv( inputCSVFile )

    def setOutputFileName(self, inputCSVFile, suffix):
        return str(inputCSVFile) + '.' + str(suffix) + '.csv'
    
    def setTimeSpan(self, in_dataset, timeFrameAttrib, fromYear, toYear):
        fromLowerBound = in_dataset[timeFrameAttrib] >= int(fromYear)
        toUpperBound = in_dataset[timeFrameAttrib] <= int(toYear)

        in_dataset = in_dataset[ fromLowerBound ] 
        in_dataset = in_dataset[ toUpperBound ]  # A reindex warning will be issue here

        return in_dataset


    def saveAsCSVFile(self, outFileName):
        print('Output CSV file to {}'.format(outFileName))
        self.cleaned_dataset.to_csv(outFileName, index = False)
