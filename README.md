# HoneyBeeColoniesInUSA2019

# Abstract

The slogan “Save the Bees” has been spreading rapidly across America since the early 2000s, and we have been hearing that the bees are dying at a swift pace. Many of these campaigns focus on harmful pesticides that kill much of the bee populations. There is also a huge astigmatism against honey as it is their main production, and bees can be harmed to produce honey. 

We wanted to determine the effectiveness of the many “Save the Bees” campaigns and how it correlates with, if at all, the population of bees in the United States, the use of bee-killing pesticides, and the sale of honey. To make an informed analysis, we chose multiple datasets from different sources. 

The first dataset, which looks at the number of bee colonies in different states, was found on the data.world website. We retrieved it from the original source: the U.S. Department of Agriculture National Agricultural Statistics Service Quick Stats Dataset.

The second dataset, which looks at the pounds of honey and the prices of honey for different states, was found on Kaggle originally. We then visited the original source, the National Agricultural Statistics Service (NASS) of the U.S. Department of Agriculture, which is developed and supported by the Albert R. Mann Library at Cornell University. We used the data provided for the years 1998 to 2017.


The third dataset looks into the use of pesticides in the United States. Retrieved from data.gov, it has data from 1992-2014 for pesticide use in the US watershed and it was created by the Department of the Interior’s US Geological Surveyor Nancy T Baker.


Combining these datasets, this package contains all the means needed to analyze them. The main programming languages used for data analysis are Python and R. 

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

# There are more in teh Wiki!!

Please refer to our [Wiki](https://github.com/ITWSDataScience/HoneyBeeColoniesInUSA2019/wiki) for moer details !!

# Contributors

If you have any questions or suggestions, or maybe you want to jump ahead and cotribute to the project in any way, please contact the authors and maintainers:

- [Pragati Pant](pantp@rpi.edu)
- [Meenu Ravi](ravim@rpi.edu)
- [Josephine Lyons](lyonsj7@rpi.edu)
- [Charly Huang](huangc11@rpi.edu)
