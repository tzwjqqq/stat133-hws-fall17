
 


 #' @title remove_missing()
 #' @description remove missing values in x
 #' @param x numeric vector
 #' @return vector without missing values
 remove_missing <- function(x, na.rm = FALSE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
   x <- x[! x %in% NA]
   return(x)
 }
 #example of remove_missing()
 a <- c(1,4,7,NA,10)
 remove_missing(a)

 
 
 
 #' @title get_minmum()
 #' @description find the minmum value in x
 #' @param x numeric vector
 #' @return the minmum value in x
 get_minmum <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
   x <- min(x, na.rm = TRUE)
   return(x)
 }
 #example
 a <- c(1,4,7,NA,10)
 get_minmum(a, na.rm = TRUE)
 
 
 
 

 
 #' @title get_maximum()
 #' @description find the maximum value in x
 #' @param x numeric vector
 #' @return the maximum value in x
 get_maximum <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
   x <- max(x, na.rm = TRUE)
   return(x)
 }
 #example
 a <- c(1,4,7,NA,10)
 get_maximum(a, na.rm = TRUE)
 
 
 
 
 
 #' @title get_range()
 #' @description find the range of x
 #' @param x numeric vector
 #' @return the range in x
 get_range <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
   x <- remove_missing(x)
   r <- max(x) - min(x)
   return(r)
 }
 #example
 a <- c(1,4,7,NA,10)
 get_range(a, na.rm = TRUE)
 
 
 
 
 #' @title get_median()
 #' @description find the median of x
 #' @param x numeric vector
 #' @return the median in x
 get_median <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
  x <- sort(remove_missing(x))
  for(i in 1:length(x)){
    if(i %% 2 == 0) {
      m <- (x[i/2]+x[i/2+1])/2
    }
    else {m <- x[(i+1)/2]}
  }
  return(m)
 }
 
 #example
 a <- c(1,4,7,NA,10)
 get_median(a, na.rm = TRUE)

 
 
 
 
 #' @title get_average()
 #' @description find the average of x
 #' @param y numeric vector
 #' @return the average in x
 
 get_average <- function(y, na.rm = TRUE){
   if(!is.numeric(y)) {
     stop('non-numeric argument')
   }
   y <- remove_missing(y)
   s <-  0
   n <- length(y)
   for(i in y){
     s <- s + i
   }
   return(s/n)
 }
 #example
 a <- c(1,4,7,NA,10)
 get_average(a, na.rm = TRUE)
 
 
 
 
 
 #' @title get_stdev()
 #' @description find the standard deviation of x
 #' @param x numeric vector
 #' @return the standard deviation of x

 get_stdev <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
  x <- remove_missing(x)
  avg <- get_average(x)
  s <- 0
  n <- length(x)
  for(i in x){
    s <- s+(i-avg)^2
  }
  sd <- sqrt(s/(n-1))
  return(sd[sd>0])
 }
 #example
 a <- c(1,4,7,NA,10)
 get_stdev(a, na.rm = TRUE)
 
 
 
 
 #' @title get_quartile1()
 #' @description find the first quartile of x
 #' @param x numeric vector
 #' @return the first quartile of x
 
 get_quartile1 <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
   x <- remove_missing(x)
   q1 <- quantile(x,0.25)
   return(q1)
 }
 #example
 a <- c(1,4,7,NA,10)
get_quartile1(a, na.rm = TRUE)
 
 
 

 #' @title get_quartile3()
 #' @description find the third quartile of x
 #' @param x numeric vector
 #' @return the third quartile of x

 get_quartile3 <- function(x, na.rm = TRUE){
  if(!is.numeric(x)) {
    stop('non-numeric argument')
  }
  x <- remove_missing(x)
  q3 <- quantile(x,0.75)
  return(q3)
 }
 #example
 a <- c(1,4,7,NA,10)
 get_quartile3(a, na.rm = TRUE)
 
 
 

 #' @title count_missing()
 #' @description calculates the number of missing values in x
 #' @param x numeric vector
 #' @return the number of missing values in x
 count_missing <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
  n <- sum(is.na(x))
  return(n)
 }
 #example
 a <- c(1,4,7,NA,10)
 count_missing(a, na.rm = TRUE) 
 



 #' @title percent10()
 #' @description calculates the 10th percentile of x
 #' @param x numeric vector
 #' @return the 10th percentile of x
 get_percentile10 <- function(x, na.rm = TRUE){
   if(!is.numeric(x)) {
     stop('non-numeric argument')
   }
   x <- remove_missing(x)
   p10 <- quantile(x,0.1)
   return(p10)
 }
 #example
 a <- c(1,4,7,NA,10)
 get_percentile10(a, na.rm = TRUE) 
 
 
 
 
 #' @title percent90()
 #' @description calculates the 90th percentile in x
 #' @param x numeric vector
 #' @return the 90th percentile in x

get_percentile90 <- function(x, na.rm = TRUE){
  if(!is.numeric(x)) {
    stop('non-numeric argument')
  }
  x <- remove_missing(x)
  p90 <- quantile(x,0.9)
  return(p90)
}
#example
a <- c(1,4,7,NA,10)
get_percentile90(a, na.rm = TRUE) 
 

 


 #' @title summary_stats()
 #' @description get a list of summary statistics
 #' @param x numeric vector
 #' @return a list of summary statistics
 summary_stats <- function(x) {
  ls <- list(
    minimum = get_minmum(x),
    percent10 = get_percentile10(x),
    quantile1 = get_quartile1(x),
    median = get_median(x),
    mean = get_average(x),
    quartile3 = get_quartile3(x),
    percent90 = get_percentile90(x),
    maximum = get_maximum(x),
    range = get_range(x),
    stdev = get_stdev(x),
    missing = count_missing(x)
  )
  return(ls)
 }
 #example
 a <- c(1,4,7,NA,10)
 stats <- summary_stats(a) 
 stats
 
 

 #' @title print_stats()
 #' @description get a list of summary statistics
 #' @param x numeric vector
 #' @return a list of summary statistics
 print_stats <- function(x) {
   num <- sprintf('%.4f', x)
   names <- names(x)
   summary <- paste(names , num, sep=':')
   df <- as.data.frame(summary)
   format <- format(df)
   return(format)
    }
 
 #example
 print_stats(stats) 



 #' @title rescale100()
 #' @description compute a rescaled vector with a potential from 0 to 100
 #' @param x numeric vector, xmin minimum, xmax maximum
 #' @return a rescaled vector
 
 rescaled100 <- function(x,xmin,xmax){
   x <- remove_missing(x)
   xmin <- get_minmum(x)
   xmax <- get_maximum(x)
   z <- 100*(x-xmin)/(xmax-xmin)
   return(z)
 }

 #example
 b <- c(18,15,16,4,17,9)
 rescaled100(b, xmin = 0, xmax = 20)


 
 #' @title drop_lowest()
 #' @description drop the lowest value of vector x
 #' @param x numeric vector of length n
 #' @return a new vector of length n-1 without the lowest value in x
 
 drop_lowest <- function(x){
   x <- remove_missing(x)
   xmin <- get_minmum(x)
   for (i in x) {
     if(i == xmin) {return(x[x != i])}
 }}
 #example
 c <- c(10,10,8.5,4,7,9)
 drop_lowest(c)
 
 
 #' @title score_homework()
 #' @description drop the lowest value of vector x
 #' @param x numeric vector of length n
 #' @return a new vector of length n-1 without the lowest value in x
 score_homework <- function(x, drop){
   if(drop == TRUE){
     x <- drop_lowest(x)
     avg <- get_average(x)
   } 
   else{avg <- get_average(x)}
   return(avg)
 }
  #example
 hws <- c(100,80,30,70,75,85)
 
 score_homework(hws, drop = TRUE)
 
 score_homework(hws, drop = FALSE)
 
 
 
 
 
 #' @title score_quiz()
 #' @description drop the lowest value of vector x
 #' @param x numeric vector of length n
 #' @return a new vector of length n-1 without the lowest value in x
 score_quiz <- function(x, drop){
   if(drop == TRUE){
     x <- drop_lowest(x)
     avg <- get_average(x)
   } 
   else{avg <- get_average(x)}
   return(avg)
 }
 #example
 quizzes <- c(100,80,70,0)
 
 score_quiz(quizzes, drop = TRUE)
 
 score_quiz(quizzes, drop = FALSE)
 
 
 
 #' @title score_lab()
 #' @description take lab attendace (0-12) and return the corresponding lab score
 #' @param x the numeric vector of lab attendance
 #' @return y the numeric vector of the corresponding lab score
 score_lab <- function(x){ 
   if (x >= 11) {
     return(100)
   } else if (x == 10){
     return(80)
   } else if (x == 9){
     return(60)
   } else if (x == 8){
     return(40)
   } else if (x == 7){
     return(20)
   } else if (x <= 6){
     return(0)
     }} 
 
 #example
 score_lab(12)
 score_lab(8)
 score_lab(5)
 
 
 
 
 
 