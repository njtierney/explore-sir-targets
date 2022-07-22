#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param R0_grid
#' @param final_prop_infected
#' @param
#' @return
#' @author njtierney
#' @export
final_outbreak_size <- function(R0_grid) {
  map_dbl(
    R0_grid,
    ~ 1 - s_inf(.x)
  ) |>
    setNames(R0_grid) |>
    percent(accuracy = 1)
}
