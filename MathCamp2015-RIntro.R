#Welcome to R! I'm going to demonstrate today using the R console.
#You can also use RStudio.
#Lesson 1: Comment on your code using the '#' symbol.

#####################################
# STEP 1: SETTING UP YOUR SCRIPT FILE
#####################################

#Begin the script file with a label for yourself and others:

#File Name: PS 812 Section 1
#Data: [Insert dataset name here]
#Author: Sarah Bouchat
#Date: 5 Sept 2014

#Next, set your working directory. This way you can save throughout without naming new file paths.
#A working directory lets R know where to look for files and data you reference, and where to deposit output you save
setwd("/Users/sbouchat/Dropbox/WISC/Classes/2014-Fall/TAing/812Section")
#If you are using Winstat or the SSCC computers, use your U drive this way
setwd("U:/Section")
#In order to do this, you must have a folder named "Section" (or whatever you'd like to call it) in your U drive already. To get to the U drive, click on the Windows button on the menu bar, and then your name. It should be in the list of drives on the left

#####################################
# STEP 2: DATA
#####################################

#There are many ways to enter data into R

#First, you can enter it manually
#Use '<-' to assign data into a variable/object

#Scalar example
scalar<-2
X<-3

#Vector or matrix examples
set<-c(1,2,3,4,5,6)
matrix.1<-matrix(set,nrow=3, ncol=2, byrow=F)
matrix.2<-matrix(1,2,3)
matrix.3<-diag(3)

#Need help? You can always ask R
help(matrix)
?matrix
??matrix

#Note that the 'data' can be numeric or string
streetnames<-c("Langdon", "Park", "University", "Observatory")

#Check that R remembers what we've entered and see what each object looks like
scalar
X
matrix.1
matrix.2
matrix.3

#Be careful! R is case sensitive
counting.is.fun<-c(1,2,3)
counting.is.fun
Counting.is.fun

#You can always remove variables with 'rm()'
rm(counting.is.fun)
counting.is.fun

#Check what variables remain in the workspace with 'ls()'
ls()

#Burn it down: remove everything from the workspace! 
rm(list=ls())

#You can save your work history this way
savehistory(file="filename.Rhistory")

#The other way to enter data is to pull in a dataset from outside R
#These datasets can be .csv, .dta, etc. formats
#To use these different data file formats, you need to have the 'foreign' package installed and to tell R what kind of file it's reading
apsr<-read.dta("apsr.dta")
summary(apsr)

#####################################
# STEP 2: BASICS OF COMPUTATION IN R
#####################################

#You can use R as a fancy calculator if you want
1+1
9^2
sqrt(2)

#You can also store calculations for later use:
Addition<-2+2
Multiplication<-3*5000

#We'll also be using many of R's probability functions in this class
#Don't worry about these right now, just keep them in mind for later

#Use R to find the cdf
pnorm(2,mean=0, sd=1)
pnorm(3,4,5)
x<-pnorm(3,4,5)

#Look up quantiles
qnorm(.5, 4,5)
qnorm(x,4,5)
help(qnorm)

#Find the density
#How likely it is that a fair coin turns up heads exactly 4 times in 10 trials?
dbinom(4,size=10,prob=0.5)


#####################################
# STEP 4: USING PACKAGES
#####################################

#These will usually come at the beginning of your script file, just after you set the working directory and before you load your data

#Load packages you will need 
library(foreign)
library (MASS)
library(xtable)

#If you've never used a package before, you may have to install it first:
install.packages("reshape")
library(reshape)

#R often automatically loads dependent packages for you, but if not it will let you know

#############################################
#Bonus Material!

#If you enjoyed starting to learn about R and want to practice some other topics on your own, here are a few things to try.

#R graphics are super nice. We can draw curves:
curve(x^2, from =-1, to =1)
curve(log(x), from=0, to=3)

#We can put in some data and look at that. 
#We will talk more about data later.
#Here is a dataset that's already in R:
data(trees)

#We put it in the search path to make things easier. 
#Don't worry too much about this for now:
attach(trees)

#Now we look at a scatter plot of trees by height and volume
plot(Height, Volume)

#We can add a title if we want:
title("Regressing Log Tree Volume on Height")

#Export it in some format or another for later use if we want
pdf("new chart.pdf")
postscript("new chart.ps")

#We can make a histogram of trees by height
breakpoints<-c(seq(60,90,by=5))
hist(Height, breaks=breakpoints)

#in color if we want
hist(Height, breaks=breakpoints,col="red", xlab="Height in Feet(?)")

#Kernel density plot. We will talk about what this means as well.
density.height<-density(Height)
plot(density.height)
detach(trees)

#Best way to learn R (or anything other software I think): play with it
#Lots of guides/tutorials/demos online

#Try looking at these demos for fun. Look how pretty!
demo(graphics)
demo(image)

#3D stuff
demo(persp)