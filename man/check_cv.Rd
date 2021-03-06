% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_cv.R
\name{check_cv}
\alias{check_cv}
\title{Check TRN Assembly}
\usage{
check_cv(x, hybrid_split = "_")
}
\arguments{
\item{x}{A matrix containing cross-validation folds inside columns and
hybrid names in rows.}

\item{hybrid_split}{Character that separates parents in hybrid names.}
}
\value{
'success', if all checks were successful.
}
\description{
\code{check_cv} Check whether all CV runs fullfil requirements.
}
\examples{
data(hybrid_nms)
check_cv(sample_cv(hybrid_nms, n_mother = 39, n_father = 33, n_hyb_trn = 200,
                    min_size = 25, rounds = 100, hybrid_split = "_"))
}

