% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process_season.R
\name{process_season}
\alias{process_season}
\title{divide_seasons}
\usage{
process_season(
  d_obs,
  options = list(wFUN = "wTSM", maxExtendMonth = 12, MaxPeaksPerYear = 3,
    MaxTroughsPerYear = 4),
  nptperyear = 36,
  south = FALSE,
  ...
)
}
\arguments{
\item{nptperyear}{Integer, number of images per year.}

\item{south}{Boolean. In south hemisphere, growing year is 1 July to the
following year 31 June; In north hemisphere, growing year is 1 Jan to 31 Dec.}

\item{...}{Others will be ignored.}

\item{d}{data.frame, with the columns of \code{t}, \code{y} and \code{w}.}

\item{options_season}{options of \code{\link[=season_mov]{season_mov()}}}
}
\description{
divide_seasons
}
\note{
site-year may be not continuous.
}
\keyword{internal}
