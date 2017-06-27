# This code snipet is an example of using dplyr and tidyr to make a wide data set "tidy". "Tidy"
# in data science means that each row represents an observation and each column represents a variable.
# The operation below is similar to the unpivot feature in SQL Sever and Power Query. The amount of M
# code that it takes to perform the same operation below would be a lot more and the code will 
# not be as intuitive.

# Make sure that the following packages are loaded on your machine. Then loads the packages on to your 
# current session.

library(tidyr)
library(dplyr)
library(readr)

# 1. Reads the data set from the "TradeBalanceInfo.csv" file into a data frame
# 2. Gather (unpivots) all of the variables (columns) starting at "Trade Balance 2000" to "Imports 2014"
# 3. Splits the variable created in step 3 into two variabless (stat and year)
# 4. Spreads (unpivots) the stat variable and populates the resulting variables with the data from the "Value" variable
# 5. Selects the columns that we want from step 4

TidyDataset <-
	read_csv("./Data/TradeBalanceInfo.csv") %>% #1
gather(group, value, `Trade Balance 2000`:`Imports 2014`, convert = TRUE) %>% #2
separate(group, into = c("stat", "Year"), "\\s+(?=\\S*+$)", convert = TRUE) %>% #3
spread(stat, value) %>% #4
select(Country, Year, `Trade Balance`, Exports, Imports) #5