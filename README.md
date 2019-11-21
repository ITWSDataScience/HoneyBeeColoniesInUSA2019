# HoneyBeeColoniesInUSA2019

# What is this package all about?

This package contains all the datsets and the means to analyze them. The main programming languages on the data analysis are Python and R. 

# Let's Get Started!

To start with, make sure you have Python and R installed in your operating system. 

Once you made sure that both programming languages can run under your OS environment, change your directory to the `scripts` directory under the root directory of this package, and execute the scripts as:

```
./main.py <TXT or CSV file in which the dataset lives> <YAML in which the attributes wished to be kept are stored>
```

For example, if I have a test.txt dataset and its corresponding attribute list in YAML file, execute the program as

```
./main.py test.txt test.yaml
```

And the program will save a cleaned dataset CSV file in the same directory under which the original dataset file resides.
Should you have question on how to utilize the program, you can also insert in the terminal:

```
./main -h
```

To get a detailed instruction.

Now you are all set. Enjoy!

# Dependencies

## Pandas 
Enable all the reading and conversion of txt and CSV format files

Quick installation with `pip`:

```
pip install pandas
```

## PyYAML
Python module that enables the parsing of YAML files. YAML files are used to store attributes and allow easy import in both Python and R langauge.

PyYAML exists by default along Python, but in case it is not yet installed, please do so with `pip`:

```
pip install pyyaml
```

# What each program is for?




# Contributors

If you have any questions or suggestions, or maybe you want to jump ahead and cotribute to the project in any way, please contact the authors and maintainers:

- [Pragati Pant]()
- [Meenu Ravi]()
- [Jusephine Lyons]()
- [Charly Huang](huangc11@rpi.edu)