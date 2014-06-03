rankall <- function(outcome, num = "best") {
        outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        outcome.list <- split(outcome.data, outcome.data$State)
        hospital <- NULL
        state <- NULL
        for (i in seq_along(outcome.list)) {
                if (outcome == "heart attack") {
                        if (num == "best") {
                                ha.list <- outcome.list[[i]][, c(2, 7, 11)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[1, 1])
                                state <- c(state, ha.list[1, 2])
                        } else if (num == "worst") {
                                ha.list <- outcome.list[[i]][, c(2, 7, 11)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(-ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[1, 1])
                                state <- c(state, ha.list[1, 2])                
                        } else {
                                ha.list <- outcome.list[[i]][, c(2, 7, 11)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[num, 1])
                                state <- c(state, ha.list[1, 2])   
                        }
                } else if (outcome == "heart failure") {
                        if (num == "best") {
                                ha.list <- outcome.list[[i]][, c(2, 7, 17)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[1, 1])
                                state <- c(state, ha.list[1, 2])
                        } else if (num == "worst") {
                                ha.list <- outcome.list[[i]][, c(2, 7, 17)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(-ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[1, 1])
                                state <- c(state, ha.list[1, 2])                
                        } else {
                                ha.list <- outcome.list[[i]][, c(2, 7, 17)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[num, 1])
                                state <- c(state, ha.list[1, 2])   
                        }
                } else if (outcome == "pneumonia") {
                        if (num == "best") {
                                ha.list <- outcome.list[[i]][, c(2, 7, 23)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[1, 1])
                                state <- c(state, ha.list[1, 2])
                        } else if (num == "worst") {
                                ha.list <- outcome.list[[i]][, c(2, 7, 23)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(-ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[1, 1])
                                state <- c(state, ha.list[1, 2])                
                        } else {
                                ha.list <- outcome.list[[i]][, c(2, 7, 23)]
                                ha.list[, 3] <- suppressWarnings(as.numeric(ha.list[, 3]))
                                ha.list <- ha.list[order(ha.list[, 3], ha.list[, 1]), ]
                                hospital <- c(hospital, ha.list[num, 1])
                                state <- c(state, ha.list[1, 2])   
                        }    
                } else {
                        print("invalid outcome")
                }
                result <- data.frame(hospital, state)
        }
        result
}