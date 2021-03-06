% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heterozygosity.R
\name{compute_het}
\alias{compute_het}
\title{Heterozygosity}
\usage{
compute_het(x, output = c("markerNames", "markerHeterozygosity"),
  hetThresh = 0, na_coding = "??")
}
\arguments{
\item{x}{A matrix. Genotype names are stored in rows whereas marker names
are stored in columns. No missing values are allowed.}

\item{output}{Character vector with output options.}

\item{hetThresh}{Numeric or complex vector specifying the heterozygosity
threshold.}

\item{na_coding}{Scalar providing the encoding of missing elements.}
}
\value{
If \code{output} is "markerNames" a character vector with marker
 names that have passed the quality check will be returned. If \code{output}
 is "markerHeterozygosity" a numeric vector with the heterozygosity at each
 marker locus will be returned.
}
\description{
\code{compute_het} returns results from heterozygosity check
}
\examples{
 # Load a matrix with SNP genotypes encoded as numeric values
 data(imp_snps)

 # Return the names of all markers with a heterozygosity of less than 10\%.
 compute_het(imp_snps, output = "markerNames", hetThresh = 0.1)

 # Return the heterozygosity at each locus.
 compute_het(imp_snps, output = "markerHeterozygosity", hetThresh = 0)
}

