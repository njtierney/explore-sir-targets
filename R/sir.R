#' SIR model from https://staff.math.su.se/hoehle/blog/2020/03/16/flatteningthecurve.html
#'
#' @param t time
#' @param y current state vector of the ODE at time t
#' @param parms Parameter vector used by the ODE system
#'
#' @return list with one component being a vector of length two containing
#'   dS(t)/dt and dI(t)/dt
#' @export
sir <- function(t, y, parms) {
  beta <- parms[1]
  gamma <- parms[2]
  S <- y[1]
  I <- y[2]
  return(list(c(S = -beta * S * I, I = beta * S * I - gamma * I)))
}
