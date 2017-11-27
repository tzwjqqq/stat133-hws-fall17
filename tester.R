library(testthat)
source('~/stat133-hws-fall17/hw04/code/functions.R')


sink('~/stat133-hws-fall17/hw04/output/test-reporter.txt')
test_file('~/stat133-hws-fall17/hw04/code/tests.R')
sink()