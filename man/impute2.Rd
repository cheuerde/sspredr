% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/impute2.R
\name{impute2}
\alias{impute2}
\title{Imputation of mRNAs via pedigree and genomic information.}
\usage{
impute2(ped, snp, mrna, geno, bglr_model)
}
\arguments{
\item{ped}{A matrix with pedigree records.}

\item{snp}{A matrix with SNP records.}

\item{mrna}{A matrix with transcriptomic BLUEs.}

\item{geno}{NULL. Optional character vector with names corresponding to one
of the two parental pools.}

\item{bglr_model}{A character specifying the algorithm that shall be used \
when calling \code{BGLR()}.}
}
\value{
A list with model parameters used as input in the \code{BGLR()} call.
}
\description{
\code{impute2} returns a list with BGLR model parameters.
}
\examples{
data("mice_ped", "mice_snp", "mice_mrna")
geno <- rownames(mice_ped)
eta <- impute2(ped = mice_ped, snp = mice_snp, mrna = mice_mrna, geno = geno,
               bglr_model = "BRR")
str(eta)
}

