#Projekt zaliczeniowy: Tomasz Janeczko
library("ParamHelpers")
library("checkmate")
library("smoof")
library("ecr")
library("ggplot2")

dim <- 10
fun <- makeRosenbrockFunction

#Metoda wielokrotnego startu MS
multi_start_function <- function(function_object, dimensions, lower_bounds, upper_bounds, iterations = 100, runs = 50) {
  total_calls <- 0
  scores <- numeric(runs)
  for (run in 1:runs) {
    smallest_score <- Inf
    calls <- 0
    for (i in 1:iterations) {
      point <- runif(dimensions, min = lower_bounds, max = upper_bounds)
      optim_result <- optim(point, function_object(dimensions), method = "L-BFGS-B", lower = lower_bounds, upper = upper_bounds)
      calls <- calls + optim_result$counts[1]
      if (optim_result$value < smallest_score) {
        smallest_score <- optim_result$value
      }
    }
    total_calls <- total_calls + calls
    scores[run] <- smallest_score
  }
  list(scores, total_calls / runs)
}

#Poszukiwanie przypadkowe PRS
pure_random_search_function <- function(function_object, dimensions, lower_bounds, upper_bounds, iterations, runs = 50) {
  scores <- numeric(runs)
  for (run in 1:runs) {
    smallest_score <- Inf
    function_dim <- function_object(dimensions)
    for (i in 1:iterations) {
      point <- runif(dimensions, min = lower_bounds, max = upper_bounds)
      current_score <- function_dim(point)
      if (current_score < smallest_score) {
        smallest_score <- current_score
      }
    }
    scores[run] <- smallest_score
  }
  list(scores)
}

param_set <- getParamSet(fun(dim))
lower_bounds <- getLower(param_set)
upper_bounds <- getUpper(param_set)
ms_results <- multi_start_function(fun, dim, lower_bounds, upper_bounds)
prs_results <- pure_random_search_function(fun, dim, lower_bounds, upper_bounds, iterations = ms_results[[2]])
print(paste("MS average min for",dim, "dimensions:", mean(ms_results[[1]])))
print(paste("PRS average min for",dim, "dimensions:", mean(prs_results[[1]])))
par(mfrow = c(1, 2))
hist(ms_results[[1]], main = "Histogram wynikow MS", xlab = "Wyniki", ylab = "Czestosci", col = "green")
hist(prs_results[[1]], main = "Histogram wynikow PRS", xlab = "Wyniki", ylab = "Czestosci", col = "pink")
par(mfrow = c(1, 1))
wyniki <- list(MS = ms_results[[1]], PRS = prs_results[[1]])
boxplot(wyniki, col = c("green", "pink"), main = "Wykres pudelkowy wynikow PRS i MS",
        xlab = "Metoda", ylab = "Wynik")
test_result <- t.test(ms_results[[1]], conf.level = 0.95)
print(test_result)
test_result <- t.test(prs_results[[1]], conf.level = 0.95)
print(test_result)