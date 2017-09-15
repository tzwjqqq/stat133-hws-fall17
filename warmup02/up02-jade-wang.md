up02-jade-wang
================

``` r
github <- 'https://github.com/ucb-stat133/stat133-hws-fall17/'
repo <- 'raw/master/warmup02/data/nba2017-salary-points.RData'

download.file(
  url = paste0(github, repo),
  destfile = "nba2017-salary-points.RData")

 load("~/stat133/stat133-hws-fall17/warmup02/data/nba2017-salary-points.RData")


#Quantative Analysis
##brief summary
summary(position)
```

    ##    Length     Class      Mode 
    ##       441 character character

``` r
summary(salary)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ##     5145  1286000  3500000  6187000  9250000 30960000

``` r
summary(points)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##     0.0   156.0   432.0   546.6   780.0  2558.0

``` r
summary(team)
```

    ## ATL BOS BRK CHI CHO CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN 
    ##  14  15  15  15  15  15  15  15  15  15  14  14  15  15  15  14  14  14 
    ## NOP NYK OKC ORL PHI PHO POR SAC SAS TOR UTA WAS 
    ##  14  15  15  15  15  15  14  15  15  15  15  14

``` r
summary(player)
```

    ##    Length     Class      Mode 
    ##       441 character character

``` r
##check if objects are vector
is.vector(player)
```

    ## [1] TRUE

``` r
is.vector(points)
```

    ## [1] TRUE

``` r
is.vector(position)
```

    ## [1] TRUE

``` r
is.vector(team)
```

    ## [1] FALSE

``` r
is.vector(salary)
```

    ## [1] TRUE

``` r
#plots
##points
hist(points, col = "yellow") #It's generally a decreasing right-tailed graph.
```

![](up02-jade-wang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-1.png)

``` r
boxplot(points, col = "yellow")
```

![](up02-jade-wang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-2.png)

``` r
##salary
hist(salary, col = "blue") #It's generally a decreasing right-tailed graph.
```

![](up02-jade-wang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-3.png)

``` r
boxplot(salary, col = "blue")
```

![](up02-jade-wang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-4.png)

``` r
#Qualitative Analysis (of position)
factor(position)
```

    ##   [1] C  PF SG PG SF PG SF SG SF PF PF C  SG PG C  C  SF PG PF C  SG SG SF
    ##  [24] PG PF SG PG SF SF C  SF SG PG SG SF PG C  C  PG C  SG SF PF PF PF SF
    ##  [47] SG PG PF C  C  C  PG C  PF SF SG SG PG SF PG C  PF PG SF PF PG SF C 
    ##  [70] PF PF SF SG SF C  PF SG C  SF SG PG PF PF SG PF C  SG PG C  SF PF PG
    ##  [93] PG PF SG PF SG C  SF PF PF SG PF PG C  SG SG SG PG SF C  PG PF SF PG
    ## [116] C  SG PG C  PF PF SG SF SF PF SG PG C  SG C  C  C  PG C  SG PF PG PF
    ## [139] SG SF SG SF PG SF PF PG PG PF PF C  SG PF PG SG PF SF C  SG PG SG SF
    ## [162] PG SG PG C  SG PF C  PF C  PF SF SG SG C  SF C  PG PG SF PG SG PF SG
    ## [185] SG SF C  SG C  SF PF PF SG C  PG C  SF SG C  SF PG C  PG C  SF PF SG
    ## [208] C  SF PG PG SG C  SF PF SG SF SG PG PF SF C  C  PF SG PF C  SF C  SG
    ## [231] SF SG PG PG C  SG SG PF PF PG C  C  SG SF SG PF SG PG C  PG PG C  C 
    ## [254] SG PG PG PF SG C  SG PF SF SF SF SF SG PF PF PF PG C  C  SG SG SF C 
    ## [277] SF PG SF SG PF PG PF PG SF C  SF SF PF PG SG C  PG PF SG SF PF SF C 
    ## [300] SF PF SF PF PG PG PG C  PF SG PG PF SF C  SF PF PF C  PG SG SG SF PG
    ## [323] SG PF SF SG SG PG PF SF SF C  SF PF PF SG PG SG SF PF PG SG SG PG PF
    ## [346] PF SG C  SF C  C  SG SF C  C  SF PF SF C  PF SG SG PG C  PG SF PG C 
    ## [369] SG PG PF PF C  PF PG PF C  SF C  PG SG PG PF SG SG SG PG SG C  C  PG
    ## [392] SG SF PF PG SF C  PF SF SG C  PF C  C  PG PF SF PG SF PG SG SF SF PG
    ## [415] SG C  SG PF PF SF SF SG C  PF C  PG C  C  SG SF SG PF SG PG PF SG PF
    ## [438] PG SF PG C 
    ## Levels: C PF PG SF SG

``` r
position.freq = table(position)
table(position) #frequency table 
```

    ## position
    ##  C PF PG SF SG 
    ## 89 89 85 83 95

``` r
position.prop = prop.table(table(position))
prop.table(table(position)) #proportion
```

    ## position
    ##         C        PF        PG        SF        SG 
    ## 0.2018141 0.2018141 0.1927438 0.1882086 0.2154195

``` r
#plots
colors = c("red", "yellow", "green", "violet", "blue")
##relative frequencies (propoetion)
barplot(height=position.prop, xlab = "position", ylab = "Proportion", col = colors)
```

![](up02-jade-wang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-5.png)

``` r
##frequencies
barplot(height=position.freq, xlab = "position", ylab = "Frequency", col = colors)
```

![](up02-jade-wang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-6.png)

``` r
## The bar graphs of frequencies and proportion are in the same shape. There is no big difference between the proportion of each position.
```
