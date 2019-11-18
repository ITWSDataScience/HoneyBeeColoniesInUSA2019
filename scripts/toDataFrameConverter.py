#! /usr/bin/env python

import pandas as pd

class ToDataFrameConverter:
    def __init__(self, inputFile):
        # Check if there is input data
        if not inputFile:
            print('The input file is empty. Usage:\n converter = ToDataFrameConverter(inputFile.extension)')
            return
    
        # Check which format it is, then call different methods for conversion
        normalizedFileName = inputFile.lower()
        self.dataFrame = None
        if normalizedFileName.endswith('.txt'):
            print('Input file is a text file.')
            self.dataFrame = self._fromTXT(inputFile)
        elif normalizedFileName.endswith('.csv'):
            print('Input file is in CSV format.')
            self.dataFrame = self._fromCSV(inputFile)
    
    def getDataFrame(self):
        return self.dataFrame

    # Private methods
    def _fromTXT(self, inputFile):
        # return pd.read_fwf(inputFile, delimiter = " ")
        return pd.read_csv(inputFile, delimiter = "\t")
    
    def _fromCSV(self, inputFile):
        return pd.read_csv(inputFile)