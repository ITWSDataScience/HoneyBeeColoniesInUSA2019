#!/usr/bin/env python

import pandas as pd

from toDataFrameConverter import ToDataFrameConverter

class AbstractCleaner:
    def __init__(self, inputFile, attributeList, timeRangeTuple, timeFrameAttrib = 'Year'):
        '''
        @brief Although AbstractCleaner is an abstract class by itself, it implement all the essential functionalities
        that any derived cleaner class needs.
        @inputFile: the input CSV or TXT file in which the dataset is stored
        @attributeList: The Python list in which the attributes wished to be kept are stored
        @timeFrameAttrib: The attribute with which to filter the time frame range. The attribute is 'Year' by default
        @timeRangeTuple: It is a tuple in the form of (fromYear, toYear)
        '''
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
