# #Pakiety
# print('Pakiety')
# library(MASS)                  #Sprawia, że obiekty z pakietu MASS są osiągalne w bieżącym środowisku
# install.packages("plot3D")     #Podstawowy sposób instalacji pakietów

#Listy (wektory uogólnione) - mogą zwracać obiekty dowolnego typu
print('Listy')
l <- list(a = c(2, 3, 4), f = function(x) sum(x^2), b = "Ala ma kota")
l
l[[1]]            #[[]] daje dostęp do elementów listy
l[[1]][2]
l[[2]]
l[[2]](3)
l[['a']]          #Jeśli elementy listy mają nazwy, to można ich używać jako indeksów
l$a
l[['a']][2]
l$a[2]
l$f(3)
f <- function() {       #Użycie list do zwracania złożonych wartości z funkcji
  list(x = 10, y = 32)
}
f()$x

#Czynniki (typy kategoryczne, wyliczeniowe) - typy o skończonym zestawie wartości specjalnie traktowane przez wiele funkcji przetwarzających dane
print('Czynniki')
directions <- factor(c("N", "E", "S", "W", "E", "E", "N", "S"))
directions
table(directions)
pressures <- factor(c("High", "High", "Low", "Medium", "Low", "Low"), levels = c("Low", "Medium", "High"), ordered = TRUE)
pressures
table(pressures)
# x <- sample(1:10, 100, replace = TRUE)
# y <- sample(1:1000/1000, 100, replace = TRUE)
# plot(x, y)
# fx <- factor(x)               #Zamienia na czynnik
# plot(fx, y)

#Programowanie obiektowe - poziom S3 (najprostszy z 3 podejść do programowania obiektowego)
print('Programowanie obiektowe')
x <- 1
class(x)                               #Klasa obiektu na tym poziomie
class(x) <- 'super_fighter'
class(x)
inherits(x, "super_fighter")     #Sprawdza przynależność obiektu do klasy
inherits(x, "numeric")
inherits(2, "numeric")
class(x) <- c("Ala", "Ola", "Ula")
class(x)
inherits(x, "Ala")
inherits(x, c("Ola", "Ela", "Ala"))
inherits(x, c("Ola", "Ela", "Ala"), which = TRUE)
fff <- function(x, y) {                #Funkcja generyczna - funkcja o specjalnej definicja
  UseMethod("fff")
}
fff.numeric <- function(x, y) {        #funkcja_generyczna.typ - metoda dla poszczególnej klasy
  x + pi * as.numeric(y)
}
fff.super_fighter <- function (x, y) {
  "I am a super fighter!"
}
z <- 1
fff(z, 13)                          #Właściwa metoda jest dobierana na podstawie klasy pierwszego argumentu
class(z) <- "super_fighter"
fff(z, 13)
class(z) <- c("numeric", "super_fighter", "alamakota")
fff(z, 13)                          #Wybiera metodę z najwcześniej występującej klasy w wektorze klas obiektu - u mnie nie działa
# fff("ala", 13)                       #Nie ma metody domyślnej - zwracany jest błąd
fff.default <- function (x, y) {       #funkcja_domyślna.default - domyślna metoda
  y
}
fff("ala", 13)
#Biblioteka standardowa zawiera sporą liczbę funckji generycznych: print(), plot(), summary(), predict() oraz cały zestaw operatorów
print.super_fighter <- function (x) {
  print(paste("Super fighter", x))
}
z <- 1
class(z) <- "super_fighter"
z

#Rozkłady prawdopodobieństwa
print('Rozlady prawdopodobienstwa')
#Pierwsza literka: d - gęstość lub funkcja prawdopodobieństwa, p - dystrybuanta, q - funkcja kwantylowa, r - losowanie zgodnie z rozkładem
#Reszta (rozkład): unif - jednostajny, norm - normalny, binom - dwumianowy, pois - Poissona, t - t (Studenta), f - F (Fishera-Snedecora)
dnorm(2.3)
pnorm(2.3)
x1 <- rnorm(10)
mean(x1)
var(x1)
sd(x1)
x2 <- rnorm(10, mean = 1, sd = 5)
mean(x2)
var(x2)
sd(x2)
dpois(2, lambda = 1)
rpois(10, lambda = 1)
qpois(0.75, lambda = 1)
rnorm(10)
rnorm(10)
set.seed(2024)              #Osiągamy powtarzalność obliczeń z czynnikiem losowym
rnorm(10)
set.seed(2024)
rnorm(10)

# #Rysowanie - dane trójwymiarowe
# print('Rysowanie')
# x <- seq(-pi, pi, length.out = 100)
# y <- x
# f <- outer(x, y, function(x, y) cos(y) / (1 + x^2))
# contour(x, y, f)                #Wykres konturowy (poziomicowy) - u mnie średnio działa
# contour(x, y, f, nlevels = 45)
# fa <- (f - t(f)) / 2
# contour(x, y ,fa, nlevels = 15)
# image(x, y, f)                  #Mapa temperatury (heatmap, mapa hipsometryczna)
# image(x, y, f, col = topo.colors(32, alpha = 1))
# contour(x, y, f, add = TRUE)
# persp(x, y, f)                  #Wykres trójwymiarowy w perspektywie
# persp(x, y, f, theta = 30)
# persp(x, y, f, theta = 30, phi = 40)
# persp(x, y, f, theta = 30, phi = 40, shade = 0.75, border = NA)
# #Ładniejsze wykresy trójwymiarowe można wykonać korzystając z pakietu plot3D

#Ramki danych i dane zewnętrzne
print('Ramki danych')
df <- data.frame(nazwa = c("Tatooine", "Dagobah", "Hoth"),      #Szczególny rodzaj listy składający się z wektorów o równej długości
                 srednica = c(20, 37.4, 11.22),
                 klimat = factor(c("pustynia", "bagno", "snieg")))
df               #Macierzopodobna struktura dwuwymiarowa, gdzie w standardowej interpretacji kolumny reprezentują obserwowane zmienne
df$srednica      #Produkuje wektor
df[,2]
df["srednica"]   #Produkuje jednokolumnową ramkę danych
df[2]
df[2,]           #Wiersze ("przekroje poziome") reprezentują poszczególne obserwacje
# Auto <- read.table("Auto.data")       #Wczytanie danych zewnętrznych; write.table() - zapisuje ramki danych do pliku tekstowego
# class(Auto)
# Auto
Auto <- read.table("Auto.data", header = TRUE, na.strings = "?")      #Uwzględnia wiersz nagłówka i dane nieoznaczone (?)
names(Auto)                                                               #Nazwy kolumn
head(Auto)                                                                #Górne 7 wierszy
# Auto <- read.csv("Auto.csv", header = TRUE, na.strings = "?")           #Wczytanie z pliku CSV; read.csv2() - dla polskich danych
# head(Auto)
dim(Auto)                                                                 #Liczy ilość wierszy i kolumn
Auto <- na.omit(Auto)                                                     #Usuwa wiersze z wartościami nieistniejącymi
dim(Auto)
Auto[2, 5]                                                                #Indeksowanie ramki danych
Auto[2, "weight"]
Auto[, 5]                                                                 #Wyświetla kolumnę 5
Auto[, "weight"]
Auto[1:4]                                                                 #Wyświetla kolumny 1-4
Auto[1:4,]                                                                #Wyświetla wiersze 1-4
Auto[3:10, c(2, 5)]                                                       #Wyświetla kolumnę 2 i 5 z wierszy 2-5
Auto[3:10, c("cylinders", "weight")]
Auto$mpg