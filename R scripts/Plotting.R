# printing in different colors different groups of data

x <- rnorm(100)
y <- x + rnorm(100)

#create vector that have two  levels of 50 points each
g <-gl(2,50, labels = c("Male", "Female"))

#plot the canvas but do not put the data on it
plot(x,y, type =  "n")

#adding one group at a time
points(x[g == "Male"], y[g == "Male"], col = "red")
points(x[g == "Female"], y[g == "Female"], col = "blue", pch = 19)



