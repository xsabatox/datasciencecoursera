rankhospital <- function(state, outcome, num = "best") {
        outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        state.test <- sum(outcome.data$State == state)
        if (state.test == 0) {
                stop("invalid state") 
        }
        subset <- data.frame()
        if (outcome == "heart attack") {
                subset <- outcome.data[outcome.data$State == state, c(2, 11) ]
        } else if (outcome == "heart failure") {
                subset <- outcome.data[outcome.data$State == state, c(2, 17) ]
        } else if (outcome == "pneumonia") {
                subset <- outcome.data[outcome.data$State == state, c(2, 23) ]
        } else { 
                stop("invalid outcome") 
        }
        result <- character()
        if (num == "best") {
                subset[, 2] <- suppressWarnings(as.numeric(subset[, 2]))
                subset <- subset[order(subset[, 2], subset[, 1]), ]
                result <- subset[1, 1]
        } else if (num == "worst") {
                subset[, 2] <- suppressWarnings(as.numeric(subset[, 2]))
                subset <- subset[order(-subset[, 2], subset[, 1]), ]
                result <- subset[1, 1]
        } else {
                subset[, 2] <- suppressWarnings(as.numeric(subset[, 2]))
                subset <- subset[order(subset[, 2], subset[, 1]), ]
                result <- subset[num, 1]
        }
        result
}