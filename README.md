# R-programming-P4

This project analyzes the ranking of hospitals in the US based on health care.

The program best returns a character vector with the name of the hospital that has the lowest 30-day mortality for the specified outcome (“heart attack”, “heart failure”, or “pneumonia”) in that state. 

For example, the following command yields the hospital in Maryland that has the lowest 30-day mortality for heart attack

best("MD", "heart attack")  
[1] "JOHNS HOPKINS HOSPITAL, THE"

The program rankhospital takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. 

For example, in order to check which hospital is ranked 4th in Texas amongst hospitals with lowest 30-day mortality rate for heart failure we get 

rankhospital("TX", "heart failure", 4)

[1] "DETAR HOSPITAL NAVARRO"
