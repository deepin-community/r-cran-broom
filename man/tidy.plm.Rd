% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plm-tidiers.R
\name{tidy.plm}
\alias{tidy.plm}
\alias{plm_tidiers}
\title{Tidy a(n) plm object}
\usage{
\method{tidy}{plm}(x, conf.int = FALSE, conf.level = 0.95, ...)
}
\arguments{
\item{x}{A \code{plm} objected returned by \code{\link[plm:plm]{plm::plm()}}.}

\item{conf.int}{Logical indicating whether or not to include a confidence
interval in the tidied output. Defaults to \code{FALSE}.}

\item{conf.level}{The confidence level to use for the confidence interval
if \code{conf.int = TRUE}. Must be strictly greater than 0 and less than 1.
Defaults to 0.95, which corresponds to a 95 percent confidence interval.}

\item{...}{Additional arguments. Not used. Needed to match generic
signature only. \strong{Cautionary note:} Misspelled arguments will be
absorbed in \code{...}, where they will be ignored. If the misspelled
argument has a default value, the default value will be used.
For example, if you pass \code{conf.lvel = 0.9}, all computation will
proceed using \code{conf.level = 0.95}. Additionally, if you pass
\code{newdata = my_tibble} to an \code{\link[=augment]{augment()}} method that does not
accept a \code{newdata} argument, it will use the default value for
the \code{data} argument.}
}
\description{
Tidy summarizes information about the components of a model.
A model component might be a single term in a regression, a single
hypothesis, a cluster, or a class. Exactly what tidy considers to be a
model component varies across models but is usually self-evident.
If a model has several distinct types of components, you will need to
specify which components to return.
}
\examples{

if (requireNamespace("plm", quietly = TRUE)) {

library(plm)

data("Produc", package = "plm")
zz <- plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
  data = Produc, index = c("state", "year")
)

summary(zz)

tidy(zz)
tidy(zz, conf.int = TRUE)
tidy(zz, conf.int = TRUE, conf.level = 0.9)

augment(zz)
glance(zz)

}

}
\seealso{
\code{\link[=tidy]{tidy()}}, \code{\link[plm:plm]{plm::plm()}}, \code{\link[=tidy.lm]{tidy.lm()}}

Other plm tidiers: 
\code{\link{augment.plm}()},
\code{\link{glance.plm}()}
}
\concept{plm tidiers}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with columns:
  \item{conf.high}{Upper bound on the confidence interval for the estimate.}
  \item{conf.low}{Lower bound on the confidence interval for the estimate.}
  \item{estimate}{The estimated value of the regression term.}
  \item{p.value}{The two-sided p-value associated with the observed statistic.}
  \item{statistic}{The value of a T-statistic to use in a hypothesis that the regression term is non-zero.}
  \item{std.error}{The standard error of the regression term.}
  \item{term}{The name of the regression term.}

}
