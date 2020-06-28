library(lattice)
package ?lattice #getting help about the lattice package

library (help = lattice)
data(environmental) #getting the data set from the library
?environmental #data set description
head(environmental)
xyplot(ozone ~ radiation, data = environmental)
# data = environmental -- tells from which dataset to get those variables
xyplot(ozone ~ radiation, data = environmental, main = "Ozon vs. Radiation")
xyplot(ozone ~ temperature, data = environmental)

# we wan to see if the relationship between ozone and radiation changes as the temperature is changing
summary(environmental$temperature) #temperature is a continious variable
# we cannot condition (ozone ~ radiation) on a continious variable
# so we cut temperature into several categories
temp.cut <- equal.count(environmental$temperature,4) #dividing temperature into 4 equal categories
temp.cut

xyplot(ozone ~ radiation | temp.cut, data = environmental, main = "Ozon vs. Radiation")
# plotting ozone ~ radiation but for different ranges of temperature

xyplot(ozone ~ radiation | temp.cut, data = environmental, layout = c(1,4), main = "Ozon vs. Radiation")
xyplot(ozone ~ radiation | temp.cut, data = environmental, layout = c(1,4), as.table = TRUE, main = "Ozon vs. Radiation")

xyplot(ozone ~ radiation | temp.cut, data = environmental, as.table = TRUE, pch = 20,
       panel = function(x,y,...){
         panel.xyplot(x,y,...)
         fit <- lm(y~x)
         panel.abline(fit, lwd = 2)
       })

xyplot(ozone ~ radiation | temp.cut, data = environmental, as.table = TRUE, pch = 20,
       panel = function(x,y,...){
         panel.xyplot(x,y,...)
          panel.loess(x,y)
       }, xlab = "Solar Radiation", ylab = "Ozone(ppb)", main = "Ozon vs. Radiation")


########################################################
wind.cut <- equal.count(environmental$wind,4)
wind.cut

xyplot(ozone ~ radiation | temp.cut * wind.cut, data = environmental, as.table = TRUE, pch = 20,
       panel = function(x,y,...){
         panel.xyplot(x,y,...)
         panel.loess(x,y)
       }, xlab = "Solar Radiation", ylab = "Ozone(ppb)", main = "Ozon vs. Radiation")

##############################################################
# getting scatter plots of all variables against each other

splom(~environmental)
##############################################################

histogram (~temperature, data = environmental)

histogram (~ozone | wind.cut, data = environmental)

histogram (~ozone | wind.cut * temp.cut, data = environmental)






