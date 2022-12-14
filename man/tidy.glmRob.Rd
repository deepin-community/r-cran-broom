% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/robust-glmrob-tidiers.R
\name{tidy.glmRob}
\alias{tidy.glmRob}
\title{Tidy a(n) glmRob object}
\usage{
\method{tidy}{glmRob}(x, ...)
}
\arguments{
\item{x}{A \code{glmRob} object returned from \code{\link[robust:glmRob]{robust::glmRob()}}.}

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
\details{
For tidiers for robust models from the \pkg{MASS} package see
\code{\link[=tidy.rlm]{tidy.rlm()}}.
}
\examples{

if (requireNamespace("robust", quietly = TRUE)) {
  library(robust)

  gm <- glmRob(am ~ wt, data = mtcars, family = "binomial")

  tidy(gm)
  glance(gm)
}
}
\seealso{
\code{\link[robust:glmRob]{robust::glmRob()}}

Other robust tidiers: 
\code{\link{augment.lmRob}()},
\code{\link{glance.glmRob}()},
\code{\link{glance.lmRob}()},
\code{\link{tidy.lmRob}()}
}
\concept{robust tidiers}
