x = 2
if (x>3){
y <- 10
} else {
 y <- "Hello Kitty"
}

print (y)

for (i in 1:10) {
print(i)
}

#################################################
### FOR Loop
#################################################

x <- c("a","b","c","d")
for (i in 1:4){
print (x[i])}

for (i in seq_along(x)){
print(x[i])
}

for(letter in x) {
print(letter)
}

for(i in 1:4) print(x[i]) #without {} braces

# Nested Loops
x <- matrix (1:6,2,3)
for (i in seq_len(nrow(x))){
	for (j in seq_len(ncol(x))){
		print(x[i,j])	
	}
}

#################################################
### WHILE Loop
#################################################

count <- 0
while (count <10){
print(count)
count <- count+1
}

#################################################
### FOR, NEXT Loop
#################################################

for (i in 1:10){
	if(i<4){next}
	print(i)
}




















