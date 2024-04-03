n <- 3

m <- matrix(nrow=n, ncol=n)
m[1,1] <- 1
m[1,2] <- 2
m[1,3] <- 4
m[2,1] <- 0
m[2,2] <- 4
m[2,3] <- 7
m[3,1] <- 0
m[3,2] <- 0
m[3,3] <- 5
b <- c(100, 100, 100)
print(m)
print(b)

u <- solve(m,b)
print(u)

plot(c(0,1/2,1), u, type = "b", xlab = "x", ylab = "y")