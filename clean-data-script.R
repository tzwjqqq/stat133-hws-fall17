
library(readr)
library(stringr)
source('~/stat133-hws-fall17/hw04/code/functions.R')

raw <- read.csv("~/stat133-hws-fall17/hw04/data/rawdata/rawscores.csv")


sink('~/stat133-hws-fall17/hw04/output/summary-rawscores.txt')
str(raw)
summary_stats(raw$HW1)
summary_stats(raw$HW2)
summary_stats(raw$HW3)
summary_stats(raw$HW4)
summary_stats(raw$HW5)
summary_stats(raw$HW6)
summary_stats(raw$HW7)
summary_stats(raw$HW8)
summary_stats(raw$HW9)
print_stats(raw$HW1)
print_stats(raw$HW2)
print_stats(raw$HW3)
print_stats(raw$HW4)
print_stats(raw$HW5)
print_stats(raw$HW6)
print_stats(raw$HW7)
print_stats(raw$HW8)
print_stats(raw$HW9)
sink()

#replace all NA with zero
for (i in 1:nrow(raw)) {
  for (j in 1:ncol(raw)) {
    if(is.na(raw[i,j]) == TRUE) {
      raw[i,j] <- 0
    }
  }
}
  

#rescale quizzes and tests
raw$QZ1 <- rescaled100(raw$QZ1, xmin = 0, xmax = 12)

raw$QZ2 <- rescaled100(raw$QZ2, xmin = 0, xmax = 18)

raw$QZ3 <- rescaled100(raw$QZ3, xmin = 0, xmax = 20)

raw$QZ4 <- rescaled100(raw$QZ4, xmin = 0, xmax = 20)

Test1 <- rescaled100(raw$EX1, xmin = 0, xmax = 80)

Test2 <- rescaled100(raw$EX2, xmin = 0, xmax = 90)

#adding the variable Homework
dat_hw <- raw[, 1:9]
Homework <- matrix(data = NA, nrow = 334, ncol = 1)
for (i in 1:334) {
  Homework[i,1] <- score_homework(as.numeric(dat_hw[i,]), drop = TRUE)
  Homework[1,1] <- 100
}
dat <- cbind(raw, Homework)


#adding the variable Quiz
dat_qz <- raw[, 11:14]
Quiz <- matrix(data = NA, nrow = 334, ncol = 1)
for (i in 1:334) {
  Quiz[i,1] <- score_quiz(as.numeric(dat_qz[i,]), drop = TRUE)
 if(is.na(Quiz[i] == TRUE)){
  Quiz[i] <- 100
}}
dat <- cbind(dat, Quiz)

#adding the variable Overall

Lab <- score_lab(raw$ATT)
Overall <- 0.1*Lab + 0.3*Homework + 0.15*Quiz + 0.20*Test1 + 0.25*Test2
dat <- cbind(dat, Lab, Overall)


#adding the variable Grade

Grade <- matrix(data = NA, nrow = 334, ncol = 1)
for (i in 1:334) {
  if ((dat[i, 20] > 0 ) & (dat[i, 20] <50)) {
    Grade[i, 1] <- 'F'
  } else if ((dat[i, 20] >= 50) & (dat[i, 20] <60)) {
    Grade[i, 1] <- 'D'
  } else if ((dat[i, 20] >= 60) & (dat[i, 20] <70)) {
    Grade[i, 1] <- 'C-'
  } else if ((dat[i, 20] >= 70) & (dat[i, 20] <77.5)) {
    Grade[i, 1] <- 'C'
  } else if ((dat[i, 20] >= 77.5) & (dat[i, 20] <79.5)) {
    Grade[i, 1] <- 'C+'
  } else if ((dat[i, 20] >= 79.5) & (dat[i, 20] <82)) {
    Grade[i, 1] <- 'B-'
  } else if ((dat[i, 20] >= 82) & (dat[i, 20] <86)) {
    Grade[i, 1] <- 'B'
  } else if ((dat[i, 20] >= 86) & (dat[i, 20] <88)) {
    Grade[i, 1] <- 'B+'
  } else if ((dat[i, 20] >= 88) & (dat[i,20] <90)) {
    Grade[i, 1] <- 'A-'
  } else if ((dat[i, 20] >= 90) & (dat[i, 20] <95)) {
    Grade[i, 1] <- 'A'
  } else if ((dat[i, 20] >= 95) & (dat[i, 20] <100)) {
    Grade[i, 1] <- 'A+'
  }
}


dat <- cbind(dat, Grade)


#exporting

sink('~/stat133-hws-fall17/hw04/output/lab-stats.txt')
summary_stats(dat$Lab)
print_stats(dat$Lab)
sink()

  
sink('~/stat133-hws-fall17/hw04/output/Homework-stats.txt')
summary_stats(dat$Homework)
print_stats(dat$Homework)
sink() 
  
sink('~/stat133-hws-fall17/hw04/output/Quiz-stats.txt')
summary_stats(dat$Quiz)
print_stats(dat$Quiz)
sink()


sink('~/stat133-hws-fall17/hw04/output/Test1-stats.txt')
summary_stats(Test1)
print_stats(Test1)
sink()

sink('~/stat133-hws-fall17/hw04/output/Test2-stats.txt')
summary_stats(Test2)
print_stats(Test2)
sink()  
  
sink('~/stat133-hws-fall17/hw04/output/Overall-stats.txt')
summary_stats(Overall)
print_stats(Overall)
sink()  
  
