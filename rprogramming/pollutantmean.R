## Pollutant Mean

## Description
## 'pollutantmean' calculates the mean of a pollutant (sulfate or nitrate) across a specified list of pollutant monitors.
## It returns the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values).

## Data
## 'pollutantmean' works with comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution. 
## Each file must contain data from a single monitor and the file name must contain the ID number of that monitor. For example, data for monitor 200 is contained in the file "200.csv". 
## Each file contains three variables:
## * Date: the date of the observation in YYYY-MM-DD format (year-month-day)
## * sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
## * nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

## Usage
## pollutantmean(directory, pollutant, id)

## Arguments
## 'directory' is a character vector of length 1 indicating the location of the CSV files.
## 'pollutant' is a character vector of length 1 indicating the name of the pollutant for which we will calculate the mean; either "sulfate" or "nitrate".
## 'id' is an integer vector indicating the monitor ID numbers to be used. The default value is 1:332.

## Function
pollutantmean <- function(directory, pollutant, id = 1:332) {
        files <- dir(directory, full.names = TRUE)[id]
        data <- data.frame()
        for (i in seq_along(id)) {
                data <- rbind(data, read.csv(files[i]))
        }
        if (pollutant == "sulfate") {
                mean <- mean(data$sulfate, na.rm = TRUE)
        } 
        if (pollutant == "nitrate") {
                mean <- mean(data$nitrate, na.rm = TRUE)
        }
        print(mean, digits = 4)
}

## Examples
## source("pollutantmean.R")
## pollutantmean("specdata", "sulfate", 1:10)
## pollutantmean("specdata", "nitrate", 70:72)
## pollutantmean("specdata", "nitrate", 23)

## End of Pollutant Mean