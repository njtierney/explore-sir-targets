## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## this is taken from https://staff.math.su.se/hoehle/blog/2020/03/16/flatteningthecurve.html

## tar_plan supports drake-style targets and also tar_target()
tar_plan(

  # Population size
  N = 1e6,
  # Rate at which person stays in the infectious compartment (disease specific and tracing specific)
  # this corresponds to an average length of the infective period of 5 days
  gamma = 1 / 5,
  # Infectious contact rate - beta = R0/N*gamma and when R0 \approx 2.25 then  2.25/N*gamma
  # so the contact rate with a given individual is 0.0000004 contacts per day
  beta = 4.5e-07,
  # R0 for the beta and gamma values
  R0 = beta * N / gamma,
  max_time = 150,
  times = seq(0, max_time, by = 0.1),
  ode_solution = solve_rk4(
    y = c(N - 10, 10),
    times = times,
    parms = c(beta, gamma),
    beta = beta,
    gamma = gamma,
    N = N
  ),
  final_size = s_inf(R0),
  final_prop_infected = 1 - final_size,
  R0_grid = c(1.25, 1.5, 1.75, 2, 2.25, 2.5, 3),
  outbreak_size = final_outbreak_size(
    R0_grid
  ),
  # Up to, "Reducing R0"
  tar_render(explore, "doc/explore.Rmd")
)
