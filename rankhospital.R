setwd("/home/adeel/Documents/computer-science/data-science/R-programming/week-4/rprog-data-ProgAssignment3-data")

rankhospital <- function(state, outcome, num = "best") {
  
  ## Read outcome data
  
  d1<- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available")
  
  o1<-list("heart attack", "heart failure","pneumonia")
  
  ## Check that state and outcome are valid
  
  if(! state %in% d1[,7]) stop("invalid state")
  if(! outcome %in% o1) stop("invalid outcome")
  
  std<-subset(d1, d1[,7]==state)
  
  if(outcome=="heart attack") col=11
  if(outcome=="heart failure") col=17
  if(outcome=="pneumonia") col=23
  
  
  
  std<-na.omit(std)
  
  std[,col]<-as.numeric(std[,col])
  
  std2<-std[order(std[,col],std[,2]),]
  
  cbind(std2[,2],std2[,col])
  
  std2[,col]<-as.numeric(std2[,col])
  
  if(num=="worst") num<-length(std2[,col])
  
  std2[,2][num]
  

}


