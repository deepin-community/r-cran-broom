% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mclust-tidiers.R
\name{tidy.Mclust}
\alias{tidy.Mclust}
\alias{mclust_tidiers}
\title{Tidy a(n) Mclust object}
\usage{
\method{tidy}{Mclust}(x, ...)
}
\arguments{
\item{x}{An \code{Mclust} object return from \code{\link[mclust:Mclust]{mclust::Mclust()}}.}

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

if (requireNamespace("mclust", quietly = TRUE)) {

library(dplyr)
library(mclust)
set.seed(27)

centers <- tibble::tibble(
  cluster = factor(1:3),
  num_points = c(100, 150, 50), # number points in each cluster
  x1 = c(5, 0, -3), # x1 coordinate of cluster center
  x2 = c(-1, 1, -2) # x2 coordinate of cluster center
)

points <- centers \%>\%
  mutate(
    x1 = purrr::map2(num_points, x1, rnorm),
    x2 = purrr::map2(num_points, x2, rnorm)
  ) \%>\%
  dplyr::select(-num_points, -cluster) \%>\%
  tidyr::unnest(c(x1, x2))

m <- mclust::Mclust(points)

tidy(m)
augment(m, points)
glance(m)

}

}
\seealso{
\code{\link[=tidy]{tidy()}}, \code{\link[mclust:Mclust]{mclust::Mclust()}}

Other mclust tidiers: 
\code{\link{augment.Mclust}()}
}
\concept{mclust tidiers}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with columns:
  \item{proportion}{The mixing proportion of each component}
  \item{size}{Number of points assigned to cluster.}
  \item{mean}{The mean for each component. In case of 2+ dimensional models,
    a column with the mean is added for each dimension. NA for noise
    component}
  \item{variance}{In case of one-dimensional and spherical models,
    the variance for each component, omitted otherwise. NA for noise
    component}
  \item{component}{Cluster id as a factor.}

}
