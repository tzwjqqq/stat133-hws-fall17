# Title: 
#   Table of NBA teams
# Description: 
#   Data preparation. 
#   Creat a csv data file that will contain the required variables
#   to be used in ranking analysis.
# Inputs:
#   nba2017-roster.csv
#   nba2017-stats.csv


# packages
library(dplyr)
library(readr)
library(ggplot2)

#Importing data
df1 <- read_csv("/Users/Jade/stat133-hws-fall17/hw03/data/nba2017-roster.csv")
df2 <- read_csv("/Users/Jade/stat133-hws-fall17/hw03/data/nba2017-stats.csv")

# adding new variables
df2 <- mutate( df2,
       missed_fg = field_goals_atts - field_goals_made,
       missed_ft = points1_atts - points1_made,
       points = 1*points1_made + 2*points2_made + 3*points3_made,
       rebounds = off_rebounds + def_rebounds,
       efficiency = (points + rebounds + assists + steals + blocks 
                     - missed_ft - missed_fg - turnovers) / games_played
       )

# exporting efficiency summary in /output folder
sink(file = '/Users/Jade/stat133-hws-fall17/hw03/output/efficiency-summary.txt')
summary(df2$efficiency)
sink()

#merginig tables
df1$salary <- round(df1$salary/1000000, 2)
df <- merge(df1,df2)


# exporting team summary and table
teams <- df %>%
  group_by(team) %>%
  select(team, experience, salary, points3_made, points2_made, points1_made,
         points, off_rebounds, def_rebounds, assists, steals, blocks,
         turnovers, fouls, efficiency)

teams <- teams %>% summarise_all(funs(sum))

sink(file = '/Users/Jade/stat133-hws-fall17/hw03/output/team-summary.txt')
summary(teams)
sink()

write.csv(teams, file = '/Users/Jade/stat133-hws-fall17/hw03/data/nba2017-teams.csv')

# graphics

# a star plot of team
sink(file = '/Users/Jade/stat133-hws-fall17/hw03/images/teams_star_plot.pdf')
stars(teams[ , -1], labels = teams$team)
sink()

# a scatterplot of experience and salary
sink(file = '/Users/Jade/stat133-hws-fall17/hw03/images/experience_salary.pdf')

ggplot(teams) +
  geom_point(aes(experience, salary, col = team))

sink()







