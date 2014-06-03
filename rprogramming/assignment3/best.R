best <- function(state, outcome) {
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
        subset[, 2] <- suppressWarnings(as.numeric(subset[, 2]))
        subset <- subset[order(subset[, 2], subset[, 1]), ]
        subset[1, 1]
}