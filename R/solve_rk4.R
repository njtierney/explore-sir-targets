#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param y
#' @param times
#' @param parms
#' @return
#' @author njtierney
#' @export
solve_rk4 <- function(y = c(N - 10, 10), times = times, parms = c(beta, gamma),
                      beta = beta,
                      gamma = gamma,
                      N = N) {
  rk4(
    y = y,
    times = times,
    func = sir,
    parms = parms
  ) |>
    as_tibble() |>
    setNames(c("t", "S", "I")) |>
    mutate(
      beta = beta,
      gama = gamma,
      R0 = N * beta / gamma,
      s = S / N,
      i = I / N,
      type = "without_intervention"
    )
}
