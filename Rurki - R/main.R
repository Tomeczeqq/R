#Tomasz Janeczko - zadanie obliczeniowe: potencjał elektromagnetyczny
#R indeksuje od 1 => Wszystko przesuwamy o 1 - odnosnie macierzy i tablic
n_str <- readline( "Podaj n >= 3")
n <- strtoi(as.integer(n_str), base = 10)
rho <- 1

#Tworzymy przedzialy odpowiedniej dlugosci
h <- 3 / n
x <- 0:n
for (i in 0:n) {
  x[i + 1] <- i * h
}
#print(h)
#print(x)

#Tworzymy macierz B
B <- matrix(0, ncol = n, nrow = n)
B[0 + 1, 0 + 1] <- 1 - 1 / h
for (i in 1:(n - 1)) {
  B[i, i + 1] <- 1 / h
  B[i + 1, i] <- 1 / h
  B[i + 1, i + 1] <- -2 / h
}
#print(B)

#Tworzymy macierz L tylda
L <- 1:n
L[0 + 1] <- 5 - rho * h / 20
Er1 <- 1 / 10
Er2 <- 1 / 5
Er3 <- 1 / 1

for (i in 1:(n - 1)) {
  result <- 0
  #Liczymy wynik w przedziale [0,1]
  u_11 <- min(x[i + 1], 1)
  l_11 <- min(x[i - 1 + 1], 1)
  result <- result + Er1 * (u_11 * u_11 / 2 - x[i - 1 + 1] * u_11)
  result <- result - Er1 * (l_11 * l_11 / 2 - x[i - 1 + 1] * l_11)
  u_12 <- min(x[i + 1 + 1], 1)
  l_12 <- min(x[i + 1], 1)
  result <- result + Er1 * (-u_12 * u_12 / 2 + x[i + 1 + 1] * u_12)
  result <- result - Er1 * (-l_12 * l_12 / 2 + x[i + 1 + 1] * l_12)
  #Liczymy wynik w przedziale (1,2]
  u_21 <- min(max(x[i + 1], 1), 2)
  l_21 <- min(max(x[i - 1 + 1], 1), 2)
  result <- result + Er2 * (u_21 * u_21 / 2 - x[i - 1 + 1] * u_21)
  result <- result - Er2 * (l_21 * l_21 / 2 - x[i - 1 + 1] * l_21)
  u_22 <- min(max(x[i + 1 + 1], 1), 2)
  l_22 <- min(max(x[i + 1], 1), 2)
  result <- result + Er2 * (-u_22 * u_22 / 2 + x[i + 1 + 1] * u_22)
  result <- result - Er2 * (-l_22 * l_22 / 2 + x[i + 1 + 1] * l_22)
  #Liczymy wynik w przedziale (2,3]
  u_31 <- max(x[i + 1], 2)
  l_31 <- max(x[i - 1 + 1], 2)
  result <- result + Er3 * (u_31 * u_31 / 2 - x[i - 1 + 1] * u_31)
  result <- result - Er3 * (l_31 * l_31 / 2 - x[i - 1 + 1] * l_31)
  u_32 <- max(x[i + 1 + 1], 2)
  l_32 <- max(x[i + 1], 2)
  result <- result + Er3 * (-u_32 * u_32 / 2 + x[i + 1 + 1] * u_32)
  result <- result - Er3 * (-l_32 * l_32 / 2 + x[i + 1 + 1] * l_32)
  #print(c(i, x[i-1+1], x[i+1], x[i+1+1]))
  L[i + 1] <- (-rho / h) * result
}
L[n - 1 + 1] <- L[n - 1 + 1] - 2 / h
#print(L)

#Wyznaczamy rozwiazanie w i z tego ostateczne rozwiazanie u
w <- solve(B, L)
#print(w)
u <- 0:n
for (i in 0:(n - 1)) {
  u[i + 1] <- w[i + 1]
}
u[n + 1] <- 2
#print(u)

#Rysujemy wykres wyliczonego przyblizenia funkcji u
plot(x, u, type = "o", xlab = "x", ylab = "u", cex = 0.5)