#Podstawy
# print('Podstawy')
# help("c")
# ?c
# help.search("vector")
# ??vector

#Zmienne
print('Zmienne')
x <- 10
2 -> y.z
._e = 34.5
x
y.z
._e
ls()              #Zwraca listę istniejących obiektów
rm(x)             #Usuwa x
rm(list = ls())   #Usuwa listę istniejących obiektów

#Wektory numeryczne
print('Wektory numeryczne')
typeof(2)       #double
mode(2)         #numeric
typeof(2L)      #integer
mode(2L)        #numeric
#-Funckja c() - konkatenacja wektorów
x <- c(2, 10, 17)
x
length(x)
y <- c(c(2, 3), 10, c(3, 2, -1))
y
length(y)
#-Funkcja rep() - powtarzanie elementów
z1 <- rep(x, times = 3)
z1
z2 <- rep(x, each = 3)
z2
z3 <- rep(x, length.out = 5)
z3
#-Funkcja seq() i operator : - ciągi arytmetyczne
2:10
seq(2, 10)
seq(from = 2, to = 10)
seq(to = 10, from = 2)
seq(from = 10, to = 2)
10:2
seq(2, 10, by = 2)
seq(2, 10, length.out = 8)
seq(2, 10, along.with = x)
seq_along(x)        #Poręczny (i szybszy) zamiennik seq(along.with = x)
#-Operatory arytmetyczne i inne funckje zwektoryzowane (produkują 'wektorowy' wynik)
x + c(1, 0 , -1)
1:4 * 2:5
x^2
exp(y)
sqrt(seq(0, 1, by = 0.1))
x * 3 + 1           #Reguła odzysku - wektor krótszy jest wydłużany do długości dłuższego
y + 1:4             #Ostrzeżenie - długość dłuższego nie jest wielokrotnością krótszego
#-Funkcje agregujące
mean(x)             #Średnia arytmetyczna
median(y)           #Mediana
var(rep(1, times = 20))   #Wariancja
sd(2 * y - 3)       #Odchylenie standardowe
max(x)              #Maksimum
which.min(x)        #Pierwszy indeks najmniejszego elementu
sum(x^2)            #Suma kwadratów
#-Indeksowanie wektorów - indeksem pierwszego elementu jest 1; [] - zwraca podwektor
x[1]
x[3]
x[c(1, 3)]
y[2:4]
x[-2]               #Oznacza brak wskazanych składowych w wektorze wynikowym, ale niedopuszczalne jest mieszanie
y[-1:-3]            #indeksów dodatnich i ujemnych
x[[2]]              #[[]] - zwraca pojedynczy element
# y[[10]]             #Zwraca błąd - element nie istnieje

#Wektory logiczne
print('Wektory logiczne')
l <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
l
x == c(1, 2, 3)
x > 10
x * y^2 < 30         #Działa reguła odzysku
y > 0 & y < 5        #Na wektorach logicznych działają spójniki logiczne &, |, !
# y > 0 && y < 5     #&& i || - wersje podwójne, które uwzględnia tylko pierwsze składowe operatorów
all(y > 0 & y < 5)   #Zastępuje &&
any(y > 0 & y < 5)   #Zastępuje ||
y[c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE)]
y[y > 0 & y < 5]
y[y > median(y)]
y[y < mean(y)]
sum(y > 0)           #Wartości logiczne w razie potrzeby są konwertowane na 0 i 1
sum(y < mean(y))

#Wektory znakowe (napisowe)
print('Wektory znakowe')
s <- c("Ala", "Ola", "Ula")
s
s[2]
paste(s, collapse = "-")    #Wyświetla - miedzy elementami wektora
paste(s, 1:6)
paste(s, 1:6, collapse = "")
as.numeric("32")
as.logical("true")

#Wektory nieistniejące
print('Wektory nieistniejace')
isFALSE(NA)
isTRUE(NA)
is.na(NA)
z <- c(1, 2)
z[5] <- 10
z
z + 30
z == 1
z == NA             #Wynikiem jest NA
is.na(z)
z[!is.na(z)]        #Wyświetla wartości niebedące NA
mean(z)
mean(z[!is.na(z)])
mean(z, na.rm = TRUE)
z[is.na(z)] <- -1   #Przypisuje -1 tam gdzie jest NA
z

#Wektory nazwane - składowe wektorów mogą mieć nazwy
print('Wektory nazwane')
nx <- c(a = 2, b = -1 , c = 0)
nx
nx['a']             #Elementy mogą być indeksowane przy pomocy nazwy
nx[c("a", "b")]
nx["c"]
names(nx)           #Odczytuje nazwy elementów wektora
names(nx) <- c("pierwszy", "drugi", "trzeci")
nx
nx["drugi"]

#Macierze - wektory o specjalnie ustawionych wymiarach, tzn. właściwości dim
print('Macierze')
m <- matrix(c(1, 2, 3, 4), nrow = 2)
m
class(m)
dim(m)                #Wymiary macierzy
m2 <- c(1, 2, 3, 4)
dim(m2) <- c(2, 2)
m2
class(m2)
dim(m2) <- c(1, 4)
m2
class(m2)
matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)   #Przydziela wartości po wierszu zamiast po kolumnie
m <- matrix(1:4, nrow = 2)
m^2
sqrt(m) + matrix(rep(1, times = 4), nrow = 2)
m + 1
m < 2
m[1, 2]             #[row, column]
m[2, 2] <- 0
m
m[2,]               #Drugi wiersz
m[,1]               #Pierwsza kolumna
m[,1] <- -1
m1 <- matrix(1:4, nrow = 2)
m1
m2 <- diag(nrow = 2)    #Macierz diagonalna
m2
m1 * m2             #Mnożenie skalarne
m1 %*% m2           #Mnożenie wektorowe
A <- matrix(1:4, nrow = 2)
B <- c(1, 0)
solve(A, B)         #Rozwiązanie układu Ax=B
t(A)                #Macierz transponowana
solve(A)            #Macierz odwrotna A^-1
det(A)              #Wyznacznik macierzy A
diag(A)             #Macierz diagonalna powstała z macierzy A
sum(diag(A))        #Ślad - suma elementów na głównej przekątnej

#Instrukcje sterujące
print('Instrukcje sterujace')
if (runif(1) > 0.5) {       #runif generuje losowa wartosc miedzy 0 a 1
  "Orzel"
} else {
  "Reszka"
}
x <- runif(20)
#runif(), (?runif) - zwraca jedną lub więcej wylosowanych liczb wg jednostajnego rozkładu prawd. - domyślnie na przedziale [0,1]
rzuty <- ifelse(x > 0.5, "Orzel", "Reszka")
rzuty
liczba_orlow <- 0
while (runif(1) > 0.5) {          #Pętla warunkowa
  liczba_orlow <- liczba_orlow + 1
}
liczba_orlow
liczba_orlow <- 0
repeat {                             #Pętla (potencjalnie) nieskończona
  if (runif(1) <= 0.5) break
  liczba_orlow <- liczba_orlow + 1
}
liczba_orlow
x <- runif(20)
x
for (i in seq_along(x)) {            #Pętla iteratorowa
  print(mean(x[1:i]))
}
#Alternatywą są funckje zwektoryzowane oraz funckje wspierające styl funkcyjny, w szczególności lapply(),(?lapply)

#Funckje - są obiektami
print('Funkcje')
f <- function(x, a = 2) x^2 + 10 * a
g <- function(z) {
  stopifnot(all(z>0))
  sin(z^2) - pi
}
h <- function(x) {
  if (x < 0) {
    return(x + 10)
  }
  cos(x - 1)
}
f(10)
f(10,4)
f(a = -1, x = 3)
f(c(-1,1))
g(3)
# g(-3)
h(-1)
h(10)

# #Rysowanie
# print('Rysowanie')
# #-Dane jednowymiarowe
# x <- sample(1:1000, 100, replace = TRUE)        #Losowanie próbek z powtórzeniami
# hist(x)                 #Histogram
# hist(x, freq = FALSE)
# hist(x, breaks = 4)
# hist(x, breaks = c(0, 210, 650, 884, 1000))
# boxplot(x)              #Wykres pudełkowy
# boxplot(x, horizontal = TRUE)
# #-Dane dwuwymiarowe
# x <- sample(1:1000, 100, replace = TRUE)
# y <- sample(1:1000, 100, replace = TRUE)
# plot(x, y)              #Wykres rozproszenia (scatter plot)
# # plot(x, y, xlab = "Zmienna x", ylab = "Zmienna y", main = "Wykres y względem x")
# # pdf("scatterplot.pdf")    #Zachowanie rysunku w pliku
# plot(x, y, col = "pink")
# # dev.off()
# x <- seq(-pi, pi, length.out = 100)
# plot(x, sin(x), type = "l", ylab = "y")         #Tworzy wykres sin(x)
# lines(x, cos(x), type = "l", col = "orange")    #Dodaje linię do istniejącego wykresu

#Zadania - oparte są na zbiorze danych precip z biblioteki standardowej R (?precip)
print('Zadania')
precip
#1.Jaka jest średnia i mediana opadów w rejestrowanych miastach?
mean(precip)
median(precip)
#2.Jaka jest wariancja i odchylenie standardowe opadów?
var(precip)
sd(precip)
#3.Jaki jest rozstęp opadów?
range(precip)[[2]] - range(precip)[[1]]
#4.Jaki jest rozstęp międzykwartylowy? Porównaj wynik uzyskany przy pomocy funkcji IQR() z wynikiem uzyskanym przy pomocy funkcji fivenum().
IQR(precip)
fivenum(precip)[[4]] - fivenum(precip)[[2]]
#5.Jakie jest odchylenie przeciętne od średniej? Jakie jest odchylenie przeciętne od mediany?
d <- 0
sr <- mean(precip)
n <- length(precip)
for (i in n) {
  d <- d + precip[[i]] - sr
}
d <- d /n
d
d2 <- 0
med <- median(precip)
for (i in n) {
  d2 <- d2 + precip[[i]] - med
}
d2 <- d2 /n
d2
#6.Jaki jest poziom opadów w miastach, których nazwa zaczyna się na “M” (?startsWith)?
for (i in 1:n) {
  if (startsWith(names(precip[i]), 'M') == TRUE) {
    print(precip[i])
  }
}
#7.W których miastach opady są równe średniej?
for (i in 1:n) {
  if (precip[i] == round(sr,0)) {
    print(names(precip[i]))
  }
}
#8.W których miastach opady różnią się od mediany nie więcej niż 0.5 cala?
for (i in 1:n) {
  if (abs(precip[i] - med) <= 0.5){
    print(names(precip[i]))
  }
}
#9.W którym mieście opady są najmniejsze, a w którym największe?
names(precip[which.min(precip)])
names(precip[which.max(precip)])
#10.Ile jest miast z opadami powyżej średniej?
result <- 0
for (i in 1:n) {
  if (precip[i] > sr) {
    result <- result + 1
  }
}
result
#11.W których miastach opady leżą powyżej górnego kwartyla?
q3 <- fivenum(precip)[[4]]
for (i in 1:n) {
  if(precip[i] > q3) {
    print(names(precip[i]))
  }
}
#12.W których miastach opady leżą poniżej dolnego kwartyla?
q1 <- fivenum(precip)[[2]]
for (i in 1:n) {
  if(precip[i] < q1) {
    print(names(precip[i]))
  }
}
#13.Narysuj histogram rozkładu.
hist(precip)
#14.Narysuj wykres pudełkowy rozkładu. Które miasta stanowią wartości odstające na wykresie pudełkowym (?boxplot, ?boxplot.stats)?
bp <- boxplot(precip, horizontal = TRUE)
bp
outliers <- bp$out
print(names(precip)[precip %in% outliers])