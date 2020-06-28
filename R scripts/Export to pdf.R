pdf("dimfile.pdf") # set graphical output file
hist(rnorm(10000)) # generate 10,000 N(0,1) variates and plot their histogram
dev.off() # close the graphical output file