# Data Science Honey Bee Code
# 11/21/2019
# Author: Josephine Lyons

# libraries
library(ggplot2)
library(plotly)

# open files
honey_production <- read.csv(file="/home/josephine/Dropbox/Semester\ 7/Data\ Science/orig_honeysprices_1998-2014.csv")
pesticides  <- read.csv(file="/home/josephine/Dropbox/Semester\ 7/Data\ Science/High_Estimate_Agricultural_Pesticide_Use_by_Crop_Group_1992_to_2016.txt.cleaned_dataset.csv")
bee_population <- read.csv(file="/home/josephine/Dropbox/Semester\ 7/Data\ Science/BeeColonySurveyDatabyState1998-2014.csv")

# filter data sets (of what is not done already)
# take a look to see if any other modifications are needed
summary(honey_production)
summary(bee_population)
summary(pesticides$Compound)

# get all in same year range -> done 1998-2014
boxplot(honey_production$Year, bee_population$Year, pesticides$Year)

# modify pesticides data set so each year-state pair has the number of pesticides used
pesticides <- pesticides[c(1,2,3)]
pesticides_2 <- unique(pesticides[c(1,2)])
summary(pesticides_2)
for(i in 1:nrow(pesticides_2)) { # will create V3 -> pesticides number
  pesticides_2[i,3] <- nrow(subset(pesticides, pesticides$State == pesticides_2[i,1] & pesticides$Year == pesticides_2[i,2]))
}
summary(pesticides_2)

# Merge datasets
all_sets <- merge(honey_production, bee_population, by=c("State", "Year"))
all_sets <- merge(all_sets, pesticides_2, by=c("State", "Year"))

# Plot year-based relationships
ggplot(all_sets, aes(x = all_sets$Year, y = all_sets$Number.of.Honey.Bee.Colonies)) + geom_point(aes(color = all_sets$State)) + geom_line(aes(color = all_sets$State))  + labs(x = "Price") + labs(x = "Year") + labs(y = "Number of Colonies") + labs(color = "State")
ggplot(all_sets, aes(x = all_sets$Year, y = all_sets$Average.Price.Per.Pound......cents.)) + geom_line(aes(color = all_sets$State)) + geom_point(aes(color = all_sets$State))  + labs(x = "Year") + labs(y = "Price (Dollars)") + labs(color = "State")
ggplot(all_sets, aes(x = all_sets$Year, y = all_sets$V3)) + geom_line(aes(color = all_sets$State)) + geom_point(aes(color = all_sets$State))  + labs(x = "Year") + labs(y = "Number of Pesticides") + labs(color = "State")
ggplot(all_sets, aes(x = all_sets$Number.of.Honey.Bee.Colonies, y = all_sets$Production..1.000.pounds..)) + geom_line(aes(color = all_sets$State)) + geom_point(aes(color = all_sets$State))  + labs(y = "Production (Thousands)") + labs(x = "Colonies") + labs(color = "State") + geom_smooth(method = "lm")
ggplot(all_sets, aes(x = all_sets$Average.Price.Per.Pound......cents., y = all_sets$Production..1.000.pounds..)) + geom_point(aes(color = all_sets$State))  + labs(y = "Production") + labs(x = "Price") + labs(color = "State")

# Question 1
# What is the relationship between the national honey 
# production and the honey bee colony population in the 
# United States between the years of 1998 and 2014 and 
# how does this relationship affect the average honey 
# production prices?

# (increasing or decreasing) -> increasing: more colonies means more production
#trainingRows <- sample(1:nrow(all_sets), 0.7*nrow(all_sets))
#training <- all_sets[trainingRows, ]
#test <- all_sets[-trainingRows, ]

# Plots of the data -> look for normalization
boxplot(all_sets$Honey.Producing.Colonies....in.the.1.000s.)
boxplot(all_sets$Production..1.000.pounds..)
boxplot(log(all_sets$Honey.Producing.Colonies....in.the.1.000s.))
boxplot(log(all_sets$Production..1.000.pounds..))
hist(all_sets$Honey.Producing.Colonies....in.the.1.000s.)
hist(all_sets$Production..1.000.pounds..)
hist(all_sets$Number.of.Honey.Bee.Colonies)
hist(log(all_sets$Honey.Producing.Colonies....in.the.1.000s.))
hist(log(all_sets$Production..1.000.pounds..))

# normalize honey producing colonies and production
all_sets$logC <- log(all_sets$Number.of.Honey.Bee.Colonies)
all_sets$logP <- log(all_sets$Production..1.000.pounds..)

# get three years (1998, 2007, 2014)
s1998 <- subset(all_sets, all_sets$Year == 1998)
s2007 <- subset(all_sets, all_sets$Year == 2007)
s2014 <- subset(all_sets, all_sets$Year == 2014)

# overlook the new sets
summary(s1998)
summary(s2007)
summary(s2014)
summary(all_sets)

# pull some data aside for validation
testrows <- sample(1:nrow(all_sets), 0.30*nrow(all_sets))
test <- all_sets[testrows, ]
all_sets <- all_sets[-testrows, ]

# linear models all states (looking at normilization and which bee value)
modelLL <- lm(all_sets$Average.Price.Per.Pound......cents. 
              ~ all_sets$logC + all_sets$logP)
summary(modelLL)
    modelLP <- lm(all_sets$Average.Price.Per.Pound......cents. 
              ~ all_sets$logC + all_sets$Production..1.000.pounds..)
summary(modelLP)
modelNL <- lm(all_sets$Average.Price.Per.Pound......cents. 
              ~ all_sets$Number.of.Honey.Bee.Colonies + all_sets$logP)
summary(modelNL)
modelNP <- lm(all_sets$Average.Price.Per.Pound......cents. 
              ~ all_sets$Number.of.Honey.Bee.Colonies 
              + all_sets$Production..1.000.pounds.., data = all_sets)
summary(modelNP)
modelNP2 <- nls(log(all_sets$Average.Price.Per.Pound......cents.) 
              ~ all_sets$Number.of.Honey.Bee.Colonies 
              + all_sets$Production..1.000.pounds.., data = all_sets)
summary(modelNP2)

# non-linear multinomial ->issues since inter-corelated
c.0 <- min(all_sets$Average.Price.Per.Pound......cents.) * 0.5
model.0 <- lm(log(all_sets$Average.Price.Per.Pound......cents. - c.0) 
              ~ all_sets$logC, data = all_sets)
st <- list(a=exp(coef(model.0)[1]), b=c.0)
hold <- coef(model.0)[2]
model23 <- nls(model.0(a, hold, b), data = all_sets, start=st)

# other model attempts: year only
model11 <- lm(s2007$Average.Price.Per.Pound......cents. 
              ~ s2007$logC + s2007$logP)
summary(model11)
model22 <- lm(s2014$Average.Price.Per.Pound......cents. 
              ~ s2014$Number.of.Honey.Bee.Colonies + s2014$Production..1.000.pounds..)
summary(model22)

# looking at parts of the model -> would love to get non-linear
model0 <- lm(s2007$Average.Price.Per.Pound......cents. 
             ~ s2007$logC)
model01 <- nls(s2007$Average.Price.Per.Pound......cents. 
               ~ s2007$logC, data = s2007, start = c(a=0, b=0))
model33 <- lm(log(all_sets$Average.Price.Per.Pound......cents.) 
              ~ all_sets$logC)
model33 <- nls(all_sets$Average.Price.Per.Pound......cents. 
               ~ all_sets$logC, data = all_sets, start = st)
model33 <- lm(all_sets$Average.Price.Per.Pound......cents. 
              ~ all_sets$logP)
model33 <- lm(all_sets$Average.Price.Per.Pound......cents. 
              ~ all_sets$Number.of.Honey.Bee.Colonies)

# exponential attempt
vals <- seq(0, max(all_sets$Number.of.Honey.Bee.Colonies), 10)
mod <- exp(predict(model33, list(Number.of.Honey.Bee.Colonies=vals)))
mod2 <- exp(1)**(-1*vals)
plot(all_sets$Number.of.Honey.Bee.Colonies, all_sets$Average.Price.Per.Pound......cents.)
plot(all_sets$logC, all_sets$Average.Price.Per.Pound......cents.)
lines(vals, mod2, lwd=2, col="red")
plot(cbind(vals, model33))
abline(model33, col="red")

# plot the model
plot_ly(x=all_sets$Honey.Producing.Colonies....in.the.1.000s., y=all_sets$Production..1.000.pounds.., z=all_sets$Average.Price.Per.Pound......cents., type="scatter3d", mode="markers", color=all_sets$State)
# plot_ly(x=all_sets$logC, y=all_sets$logP, z=all_sets$Average.Price.Per.Pound......cents., type="scatter3d", mode="markers", color=all_sets$State)
#plot_ly(x=all_sets$Value, y=all_sets$logP, z=all_sets$Average.Price.Per.Pound......cents., type="scatter3d", mode="markers", color=all_sets$State)
#plot_ly(x=all_sets$Value, y=all_sets$Production..1.000.pounds.., z=all_sets$Average.Price.Per.Pound......cents., type="scatter3d", mode="markers", color=all_sets$State)
plot_ly(x=s2014$logC, y=s2014$logP, z=s2014$Average.Price.Per.Pound......cents., type="scatter3d", mode="markers", color=s2014$State)

# Question 2
# How has the use of harmful bee killing pesticides 
# correlated with the number of honey bee colonies in the 
# United States between the years 1998 and 2014?

# Use results of EDA to determine type of relationship
# (increasing or decreasing) -> well neither mostly

# Create line-of-best-fit through regression
model2 <- lm(all_sets$V3 ~ all_sets$Number.of.Honey.Bee.Colonies, data = all_sets)
summary(model2)
model14 <- lm(s2014$V3 ~ s2014$Number.of.Honey.Bee.Colonies, data = s2014)
summary(model14)

# plot model
ggplot(all_sets, aes(x = all_sets$Number.of.Honey.Bee.Colonies, y = all_sets$V3)) + geom_point(aes(color = all_sets$State))  + labs(y = "Number of Pesticides") + labs(x = "Colonies") + labs(color = "State") + geom_smooth(method = 'lm')

# additional plot model -> by year
ggplot(s2007, aes(x = s2007$Number.of.Honey.Bee.Colonies, y = s2007$V3)) + geom_point(aes(color = s2007$State))  + labs(y = "Production (Thousands)") + labs(x = "Colonies") + geom_smooth(method = 'lm')
ggplot(s2014, aes(x = s2014$Number.of.Honey.Bee.Colonies, y = s2014$V3)) + geom_point(aes(color = s2014$State))  + labs(y = "Production (Thousands)") + labs(x = "Colonies") + labs(color = "State") + geom_smooth(method = 'lm')
ggplot(s1998, aes(x = s1998$Number.of.Honey.Bee.Colonies, y = s1998$V3)) + geom_point(aes(color = s1998$State))  + labs(y = "Production") + labs(x = "Colonies") + geom_smooth(method = 'lm')
ggplot(s2007, aes(x = s2007$logC, y = s2007$V3)) + geom_point(aes(color = s2007$State))  + labs(y = "Production") + labs(x = "Colonies") + geom_smooth(method = 'lm')
ggplot(s2014, aes(x = s2014$logC, y = s2014$V3)) + geom_point(aes(color = s2014$State))  + labs(y = "Production") + labs(x = "Colonies") + geom_smooth(method = 'lm')
ggplot(s1998, aes(x = s1998$logC, y = s1998$V3)) + geom_point(aes(color = s1998$State))  + labs(y = "Production") + labs(x = "Colonies") + geom_smooth(method = 'lm')



