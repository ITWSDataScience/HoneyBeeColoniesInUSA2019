#! /usr/bin/env python

from toDataFrameConverter import ToDataFrameConverter

if __name__=='__main__':
    print('test_ToDataFrameConverter.py is launched!')

    # Test text format file
    inputTXTFile = '../test_datasets/test_sample.txt' 
    converter = ToDataFrameConverter(inputTXTFile)

    outputDataFrame = converter.getDataFrame()

    print(outputDataFrame)

    # Test CSV format file
    inputCSVFile = "../test_datasets/test.csv"
    converter = ToDataFrameConverter(inputCSVFile)
    outputDataFrame = converter.getDataFrame()
    print(outputDataFrame)