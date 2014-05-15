## Correlation

## Description
## 'corr' takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. 
## It returns a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, it returns a numeric vector of length 0.

## Data
## 'corr' works with comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution. 
## Each file must contain data from a single monitor and the file name must contain the ID number of that monitor. For example, data for monitor 200 is contained in the file "200.csv". 
## Each file contains three variables:
## * Date: the date of the observation in YYYY-MM-DD format (year-month-day)
## * sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
## * nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

## Usage
## corr(directory, threshold)

## Arguments
## 'directory' is a character vector of length 1 indicating the location of the CSV files.
## 'threshold' is a numeric vector of length 1 indicating the number of completely observed observations (on all variables) required to compute the correlation between nitrate and sulfate. The default value is 0.

## Function
corr <- function(directory, threshold = 0) {
        all.cor <- numeric()
        for (i in 1:332) {
                obs <- complete(directory, i)
                if (obs$nobs > threshold) {
                        monitor.data <- read.csv(dir(directory, full.names = TRUE)[i])
                        monitor.data <- monitor.data[complete.cases(monitor.data), ]
                        monitor.sulfate <- monitor.data$sulfate
                        monitor.nitrate <- monitor.data$nitrate
                        monitor.cor <- cor(monitor.sulfate, monitor.nitrate)
                        all.cor <- c(all.cor, cor(monitor.sulfate, monitor.nitrate))
                }
        }
        all.cor
}

## Examples
## source("corr.R")
## source("complete.R")

## cr <- corr("specdata", 150)
## head(cr)
## summary(cr)

## cr <- corr("specdata", 400)
## head(cr)
## summary(cr)

## cr <- corr("specdata")
## summary(cr)
## length(cr)

## End of Correlation