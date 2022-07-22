#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param R0
#' @return
#' @author njtierney
#' @export
# Function to compute the final size.
s_inf <- function(R0) {
  f_target <- function(x) {
    x - exp(-R0 * (1 - x))
  }

  result <- uniroot(f_target, lower = 1e-12, upper = 1 - 1e-12)$root

  return(result)
}
