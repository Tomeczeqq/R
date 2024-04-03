library(ggplot2)
library(pracma)

planck <- function(wavelength, temperature) {
  h <- 6.62607015e-34  # Stała Plancka
  k <- 1.380649e-23  # Stała Boltzmanna
  c <- 299792458  # Prędkość światła
  a <- 8.0 * pi * h * c
  b <- wavelength^5
  c <- exp(h * c / (wavelength * k * temperature)) - 1
  return(a / (b * c))
}

plot_black_body_spectrum <- function(temperature) {
  wavelengths <- seq(1e-9, 3e-6, length.out = 1000)
  spectrum <- sapply(wavelengths, planck, temperature)
  df <- data.frame(Wavelength = wavelengths, Spectrum = spectrum, Temperature = temperature)
  ggplot(df, aes(x=Wavelength, y=Spectrum, color=Temperature)) +
    geom_line() +
    labs(x="Wavelength (m)", y="Energy Density (J*s/m^3)") +
    theme_minimal()
}

calculate_power_percentage <- function(temperature, wavelength_range) {
  total_power <- integrate(function(x) planck(x, temperature), 1e-9, 3e-6)$value
  power_in_range <- integrate(function(x) planck(x, temperature), wavelength_range[1], wavelength_range[2])$value
  return((power_in_range / total_power) * 100)
}

temperatures <- c(3000, 4000, 5000)         #Przykładowe temperatury
wavelength_range <- c(1e-7, 1e-6)           #Przykładowy zakres długości fali

for (T in temperatures) {
  print(plot_black_body_spectrum(T))
  power_percentage <- calculate_power_percentage(T, wavelength_range)
  cat("Dla T =", T, "K, procent mocy emitowanej w zakresie", wavelength_range, "m wynosi", round(power_percentage, 2), "%\n")}
