library(testthat)
source('~/stat133-hws-fall17/hw04/code/functions.R')

#examples
 a <- c(1,2,3,NA,4)
 b <- c(5,6,NA,7,8)
 c <- c(1,4,7,NA,10)
 d <- c(2,5,7,11,NA)

 
 
#remove_missing()
context('testing if the missing values are removed')

test_that('removing the missing values', {
  expect_equal(remove_missing(a), c(1,2,3,4))
  expect_equal(remove_missing(b), c(5,6,7,8))
  expect_equal(remove_missing(a), c(1,4,7,10))
  expect_equal(remove_missing(a), c(2,5,7,11))
})


#get_minimum()
context('testing to get the minimum value')

test_that('returning the minimum', {
  expect_equal(get_minmum(a),1)
  expect_equal(get_minmum(b),5)
  expect_equal(get_minmum(a),1)
  expect_equal(get_minmum(a),2)
})


#get_maximum()
context('testing to get the maximum value')

test_that('returning the maximum', {
  expect_equal(get_maximum(a),4)
  expect_equal(get_maximum(b),8)
  expect_equal(get_maximum(c),10)
  expect_equal(get_maximum(d),11)
})



#get_range()
context("testing the data range")

test_that('the data range', {
  expect_equal(get_range(a),3)
  expect_equal(get_range(b),3)
  expect_equal(get_range(c),9)
  expect_equal(get_range(d),9)
})



#get_median()
context('testing to get the median')

test_that('the data median', {
  expect_equal(get_median(a),2.5)
  expect_equal(get_median(b),6.5)
  expect_equal(get_median(c),5.5)
  expect_equal(get_median(d),6)
})



#get_average()
context('testing to get the average value')

 test_that('the data average', {
   expect_equal(get_average(a), 2.5)
   expect_equal(get_average(b), 6.5)
   expect_equal(get_average(c), 5.5)
   expect_equal(get_average(d), 6.25)
 })

 
#get_stdev()
context('Testing the standard deviation')

test_that('the data standard deviation', {
  expect_equal(get_stdev(a), sd(remove_missing(a)))
  expect_equal(get_stdev(b), sd(remove_missing(b)))
  expect_equal(get_stdev(c), sd(remove_missing(c)))
  expect_equal(get_stdev(d), sd(remove_missing(d)))
 })



#get_quartile1()
contect('Testing the first quartile')

test_that('the first quartile of data', {
 expect_equal(get_quartile1(a), quantile(remove_missing(a),0.25))
 expect_equal(get_quartile1(b), quantile(remove_missing(b),0.25))
 expect_equal(get_quartile1(c), quantile(remove_missing(c),0.25))
 expect_equal(get_quartile1(d), quantile(remove_missing(d),0.25))
 })




#get_quartile3()
context('Testing the third quartile')

test_that('the third quartile of data', {
  expect_equal(get_quartile3(a), quantile(remove_missing(a),0.75))
  expect_equal(get_quartile3(b), quantile(remove_missing(b),0.75))
  expect_equal(get_quartile3(c), quantile(remove_missing(c),0.75))
  expect_equal(get_quartile3(d), quantile(remove_missing(d),0.75))
})


#count_missing()
context('Testing the number of missing vlues')

test_that('the number of missing values', {
  expect_equal(count_missing(a), 1)
  expect_equal(count_missing(b), 1)
  expect_equal(count_missing(c), 1)
  expect_equal(count_missing(d), 1)
})



#percentile10()
context('Testing the 10th percentile')

test_that('the 10th percentile', {
  expect_equal(get_percentile10(a), quantile(remove_missing(a),0.1))
  expect_equal(get_percentile10(b), quantile(remove_missing(b),0.1))
  expect_equal(get_percentile10(c), quantile(remove_missing(c),0.1))
  expect_equal(get_percentile10(d), quantile(remove_missing(d),0.1))
})


#percentile90()
context('Testing the 90th percentile')

test_that('the 90th percentile', {
  expect_equal(get_percentile90(a), quantile(remove_missing(a),0.9))
  expect_equal(get_percentile90(b), quantile(remove_missing(b),0.9))
  expect_equal(get_percentile90(c), quantile(remove_missing(c),0.9))
  expect_equal(get_percentile90(d), quantile(remove_missing(d),0.9))
})

#drop_lowest()
context('testing to drop the minimum value')

test_that('the rescaled data', {
  expect_equal(drop_lowest(a),c(2,3,4))
  expect_equal(drop_lowest(b),c(6,7,8))
  expect_equal(drop_lowest(c), c(4,7,10))
  expect_equal(drop_lowest(d), c(5,7,11))
})


#score_homework()
context('testing to get the homework average with/out dropping the lowest')

test_that('the homework average with/out dropping the lowest', {
  expect_equal(score_homework(a, drop = TRUE), 3)
  expect_equal(score_homework(b, drop = TRUE), 7)
  expect_equal(score_homework(c, drop = TRUE), 7)
  expect_equal(score_homework(d, drop = TRUE), 23/3)
  expect_equal(score_homework(a, drop = FALSE), 2.5)
  expect_equal(score_homework(b, drop = FALSE), 6.5)
  expect_equal(score_homework(c, drop = FALSE), 5.5)
  expect_equal(score_homework(d, drop = FALSE), 6.25)
})



#score_quiz()
context('testing to get the quiz average with/out dropping the lowest')

test_that('the quiz average with/out dropping the lowest', {
  expect_equal(score_quiz(a, drop = TRUE), 3)
  expect_equal(score_quiz(b, drop = TRUE), 7)
  expect_equal(score_quiz(c, drop = TRUE), 7)
  expect_equal(score_quiz(d, drop = TRUE), 23/3)
  expect_equal(score_quiz(a, drop = FALSE), 2.5)
  expect_equal(score_quiz(b, drop = FALSE), 6.5)
  expect_equal(score_quiz(c, drop = FALSE), 5.5)
  expect_equal(score_quiz(d, drop = FALSE), 6.25)
})

#score_lab()

context('testing to get the lab score based on attendance')

test_that('the lab scores based onattendance', {
  expect_equal(score_lab(3), 0)
  expect_equal(score_lab(11), 100)
  expect_equal(score_lab(8), 40)
  expect_equal(score_lab(4), 0)
})




sink('~/stat133-hws-fall17/hw04/output/test-reporter.txt')
test_file('~/stat133-hws-fall17/hw04/code/tests.R')
sink()