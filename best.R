setwd("/home/adeel/Documents/computer-science/data-science/R-programming/week-4/rprog-data-ProgAssignment3-data")

best <- function(state, outcome) {

  d1<- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available")
  
  o1<-list("heart attack", "heart failure","pneumonia")
  
  if(! state %in% d1[,7]) stop("invalid state")
  if(! outcome %in% o1) stop("invalid outcome")
  
  std<-subset(d1, d1[,7]==state)
  
  if(outcome=="heart attack") col=11
  if(outcome=="heart failure") col=17
  if(outcome=="pneumonia") col=23

  std<-na.omit(std)
  
  std[,col]<-as.numeric(std[,col])

  sort(std[,2][std[,col]==min(std[,col],na.rm=TRUE)])
  

}



