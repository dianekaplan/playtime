# -*- coding: utf-8 -*-
#medals.R
#Introduction to Bioinformatics
#Python Assignment 5, Problem 4
#Your Name: Diane Kaplan
#Date: December 7, 2014

# load data saved from download Excel file as 'csv'
all_data <- read.csv("OlympicAthletes.csv")

#==code below from Randall Tyers
olymp <- all_data[all_data$Sport == "Cycling" & all_data$Age >= 25, c("Age", "Total.Medals")]

# clean up
rm(all_data)

# aggregate the Total.Medals data according to Age
medal_totByAge <- aggregate(formula=Total.Medals ~ Age, FUN=sum, data=olymp)
#==code above from Randall Tyers


Age <- medal_totByAge$Age
Medals <- medal_totByAge$Total.Medals
plot(Age, Medals)

par() #displays current graph settings/parameters
copy.par <- par() #make a copy of your settings (useful)

title(main="Medal count for cyclists 25 and up", col.main="light blue")

par(col.lab="cornsilk4", font.lab = 2, col.axis = "cornsilk4")
par(pch=20, bg="white", col="cornsilk4")

#Add r^2 as a subtitle
rsqr <- round((cor.test(Age,Medals)$estimate),2) #let's get the R^2
rsqr <- toString(rsqr) 
mtext(paste("R^2=", rsqr, sep=" ")) #paste concatenates strings

#let's add our fit line
abline(lsfit(Age, Medals), col = "light blue", lty = 5)
