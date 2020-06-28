# counts the number of odd integers in x
oddcount <- function(x) {
k <- 0 # assign 0 to k
for (n in x) {
if (n %% 2 == 1) k <- k+1 # %% is the modulo operator
	}
return(k) # or just use k
}

##################################
 x <- c (1,2,3,5,18,9,21)
oddcount (x)


# Length in Square
mysq <- function (t){
k <-0
k <- length (t)
return (k*k)
}

x <-c(1,2,3)
x
mysq (x)