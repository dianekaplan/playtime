# -*- coding: utf-8 -*-
#weight.R
#Diane Kaplan
#messing around
#December 31, 2014

# load data saved from download Excel file as 'csv'
all_data <- read.csv("weight.csv")

install.packages ("rJava")
install.packages ("xlsx")
library("xlsx")

Average <- all_data$Average
Week <- all_data$Week
#WeekNo <- all_data$WeekNo

#convert the values from strings to date time, then display it to check
Week <- as.Date(Week, "%m/%d/%Y"); Week

plot(Week, Average)

par() #displays current graph settings/parameters
copy.par <- par() #make a copy of your settings (useful)

title(main="Weight chart", col.main="light blue")

par(col.lab="cornsilk4", font.lab = 2, col.axis = "cornsilk4")
par(pch=20, bg="white", col="cornsilk4")

#let's add our fit line
abline(lsfit(Week, Average), col = "light blue", lty = 5)

# clean up
rm(all_data)
