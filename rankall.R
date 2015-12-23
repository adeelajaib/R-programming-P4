setwd("/home/adeel/Documents/computer-science/data-science/R-programming/week-4/rprog-data-ProgAssignment3-data")

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  
  d1<- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available")
  
  ## Check that state and outcome are valid
  
  o1<-list("heart attack", "heart failure","pneumonia")
  
  ## Check that state and outcome are valid
  
  #if(! state %in% d1[,7]) stop("invalid state")
  if(! outcome %in% o1) stop("invalid outcome")
  
  if(outcome=="heart attack") col=11
  if(outcome=="heart failure") col=17
  if(outcome=="pneumonia") col=23
  
  states<-unique(sort(d1[,7]))
  
  #print(states)
  
  tab1<-NULL
  
  for(n in states)
  {
    std<-subset(d1, d1[,7]==n)
    
    #std<-na.omit(std)
    
    std[,col]<-as.numeric(std[,col])
    
    #print(cbind(sort(std[,2][std[,col]==min(std[,col],na.rm=TRUE)]),n))
    
    std2<-std[order(std[,col],std[,2]),]
    
    cbind(std2[,2],std2[,col])
    
    std2[,col]<-as.numeric(std2[,col])
    
    if(num=="worst") 
    {
      nona<-na.omit(std2[,col])
      num2<-length(nona)
    }
    else if(num=="best") num2<-1
    else num2<-num
    
    #print(cbind(std2[,2][num],n))
    
    #data.frame(std2[,2][num],n)
    
    tab1<-rbind(tab1, data.frame(std2[,2][num2],n) ) 

    
  }
  colnames(tab1)<-c("hospital","state")
  row.names(tab1) <- NULL
  tab1

  ## For each state, find the hospital of the given rank
  
  
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}

head(rankall("heart attack", 20), 10)



