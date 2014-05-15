## Complete

## Description
## 'complete' reads a directory full of files and reports the number of completely observed cases in each data file.
## It returns a data frame where the first column is the pollutant monitor id number and the second column is the number of complete cases of that monitor data sample.

## Data
## 'complete' works with comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution. 
## Each file must contain data from a single monitor and the file name must contain the ID number of that monitor. For example, data for monitor 200 is contained in the file "200.csv". 
## Each file contains three variables:
## * Date: the date of the observation in YYYY-MM-DD format (year-month-day)
## * sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
## * nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

## Usage
## pollutantmean(directory, id)

## Arguments
## 'directory' is a character vector of length 1 indicating the location of the CSV files.
## 'id' is an integer vector indicating the monitor ID numbers to be used. The default value is 1:332.

## Function
complete <- function(directory, id = 1:332) {
        files <- dir(directory, full.names = TRUE)[id]
        data <- data.frame()
        for (i in seq_along(id)) {
                data <- rbind(data, read.csv(files[i]))
        }
        complete.data <- data[complete.cases(data), ]
        nobs <- numeric()
        for (i in id) {
                nobs <- rbind(nobs, nrow(complete.data[complete.data$ID == i, ]))
        }
        data.frame(id, nobs)
}

## Examples
## complete("specdata", 1)
## complete("specdata", c(2, 4, 8, 10, 12))
## complete("specdata", 30:25)
## complete("specdata", 3)

## End of Complete