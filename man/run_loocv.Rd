% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_loocv.R
\name{run_loocv}
\alias{run_loocv}
\title{Leave-one-out cross validation}
\usage{
run_loocv(Pheno, ETA, hybrid = TRUE, father_idx = NULL, mother_idx = NULL,
  split_char = NULL, trait, iter, speed_tst = FALSE, run = 1L,
  verbose = FALSE, out_loc)
}
\arguments{
\item{Pheno}{A matrix with phenotypic BLUES.}

\item{ETA}{A list with ETA-objects for BGLR.}

\item{hybrid}{Boolean. Indicates whether prediction is done for hybrids.}

\item{father_idx}{NULL. A numeric or integer indicating the position of the
parental ID in \code{hybrid}.}

\item{mother_idx}{NULL. A numeric or integer indicating the position of the
maternal ID in \code{hybrid}.}

\item{split_char}{Character, which splits paternal and maternals IDs in
\code{hybrid}.}

\item{trait}{Character vector with the name of the trait in \code{Pheno}.}

\item{iter}{Integer with the number of BGLR iterations.}

\item{speed_tst}{Boolean. Indicates whether a speed test (TRUE) or actual
predictions (FALSE) shall be run.}

\item{run}{Integer specifying the current run corresponding to the predicted
genotype in \code{Pheno}.}

\item{verbose}{Boolean. Shall BGLR output be printed to the console?}

\item{out_loc}{Path to the directory where temporary BGLR-output will be
stored.}
}
\value{
Predicted values based on leave-one-out cross validation (LOOCV).
}
\description{
\code{run_loocv} returns a data frame with predicted values.
}
\examples{
data("hybrid_nms", "mrna", "imp_snps", "Pheno")
geno <- vapply(strsplit(hybrid_nms, split = "_"), FUN = "[[", 1,
               FUN.VALUE = character(1))
x <- imp_snps[rownames(imp_snps) \%in\% geno, ]
y <- mrna[rownames(mrna) \%in\% geno, ]
eta <- impute_eta(x = x, y = y, geno = geno, bglr_model = "BRR")
eta[] <- lapply(seq_along(eta), FUN = function(i) {
  dat <- eta[[i]]
  x <- dat[["X"]]
  rownames(x) <- hybrid_nms
  dat[["X"]] <- x
  dat
})
dir.create("./bglr_out")
run_loocv(Pheno = Pheno, ETA = eta, hybrid = TRUE, father_idx = 2,
          mother_idx = 1, split_char = "_", trait = "gtm", iter = 2500L,
          speed_tst = FALSE, run = 1L, verbose = FALSE,
          out_loc = "./bglr_out/")
unlink("./bglr_out", recursive = TRUE)
}

