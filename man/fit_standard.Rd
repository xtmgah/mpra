\name{fit_standard}
\alias{fit_standard}
\title{Unpaired linear model fit for MPRA differential analysis}
\description{
Fits a standard (weighted) linear model for each element as part of the
differential analysis routine. This is used if the columns of the
\code{MPRASet} object are not paired.
}
\usage{
fit_standard(object, design, aggregate = c("mean", "sum", "none"), 
             normalize = TRUE, return_elist = FALSE,
             return_weights = FALSE, plot = TRUE, span = 0.4, ...)
}
\arguments{
  \item{object}{An object of class \code{MPRASet}.}
  \item{design}{Design matrix specifying comparisons of interest.}
  \item{aggregate}{Aggregation method over barcodes: \code{"mean"} to
    use the average of barcode-specific log ratios, \code{"sum"} to use
    the log ratio of summed RNA and DNA counts, \code{"none"} to perform
    no aggregation (counts have already been summarized over barcodes).}
  \item{normalize}{If \code{TRUE}, perform total count normalization
    before model fitting.}
  \item{return_elist}{FIXME}
  \item{return_weights}{FIXME}
  \item{plot}{If \code{TRUE}, plot the copy number-variance relationship.}
  \item{span}{The smoothing span for \code{lowess} in estimating the
    copy number-variance relationship. Default: 0.4.}
  \item{\dots}{Further arguments to be passed to \code{lmFit} for
    obtaining residual standard deviations used in estimating the
    copy number-variance relationship.} 
}
\value{
By default, an object of class \code{MArrayLM} resulting from the
\code{eBayes} function. If \code{return_elist} is \code{TRUE}, then an
\code{EList} object containing the log-ratios, design matrix, and
weights is returned. If \code{return_weights} is \code{TRUE}, the matrix
of precision weights is returned.
}
\references{
  Law, Charity W., Yunshun Chen, Wei Shi, and Gordon K. Smyth. 
  \emph{Voom: Precision Weights Unlock Linear Model Analysis Tools for RNA-Seq Read Counts}. 
  Genome Biology 2014, 15 (2): R29. \doi{10.1186/gb-2014-15-2-r29}.
}
\examples{
data(mpraSetExample)
design <- data.frame(intcpt = 1, episomal = grepl("MT", colnames(mpraSetExample)))
mpralm_fit <- fit_standard(object = mpraSetExample, design = design,
                           aggregate = "sum", normalize = TRUE, plot = FALSE)
}
