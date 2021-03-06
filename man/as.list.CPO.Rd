% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/operators.R
\name{as.list.CPO}
\alias{as.list.CPO}
\alias{as.list.CPOPrimitive}
\alias{as.list.CPOTrained}
\title{Split a Pipeline into Its Constituents}
\usage{
\method{as.list}{CPOPrimitive}(x, ...)

\method{as.list}{CPOTrained}(x, ...)
}
\arguments{
\item{x}{[\code{\link{CPO}} | \code{\link{CPOTrained}}]\cr
The \code{\link{CPO}} or \code{\link{CPOTrained}} chain to split apart.}

\item{...}{[\code{any}]\cr
Ignored.}
}
\value{
[\code{list} of \code{\link{CPO}} | \code{list} of \code{\link{CPOTrained}}]. The primitive constituents of \code{x}.
}
\description{
Split a compound \code{\link{CPO}} or \code{\link{CPOTrained}} into a list of its constituent parts.

This is useful for inspection of pipelines, or for possible rearrangements or changes of pipelines. The
resulting \code{list} can be changed and rebuilt using \code{\link{pipeCPO}}.
}
\seealso{
Other operators: \code{\link{CPO}}, \code{\link{\%>>\%}},
  \code{\link{applyCPO}}, \code{\link{attachCPO}},
  \code{\link{composeCPO}}, \code{\link{pipeCPO}}

Other retrafo related: \code{\link{CPOTrained}},
  \code{\link{NULLCPO}}, \code{\link{\%>>\%}},
  \code{\link{applyCPO}}, \code{\link{clearRI}},
  \code{\link{getCPOClass}}, \code{\link{getCPOName}},
  \code{\link{getCPOOperatingType}},
  \code{\link{getCPOPredictType}},
  \code{\link{getCPOProperties}},
  \code{\link{getCPOTrainedCPO}},
  \code{\link{getCPOTrainedCapability}},
  \code{\link{getCPOTrainedState}},
  \code{\link{is.retrafo}},
  \code{\link{makeCPOTrainedFromState}},
  \code{\link{pipeCPO}}, \code{\link{print.CPOConstructor}}

Other inverter related: \code{\link{CPOTrained}},
  \code{\link{NULLCPO}}, \code{\link{\%>>\%}},
  \code{\link{applyCPO}}, \code{\link{clearRI}},
  \code{\link{getCPOClass}}, \code{\link{getCPOName}},
  \code{\link{getCPOOperatingType}},
  \code{\link{getCPOPredictType}},
  \code{\link{getCPOProperties}},
  \code{\link{getCPOTrainedCPO}},
  \code{\link{getCPOTrainedCapability}},
  \code{\link{getCPOTrainedState}},
  \code{\link{is.inverter}},
  \code{\link{makeCPOTrainedFromState}},
  \code{\link{pipeCPO}}, \code{\link{print.CPOConstructor}}
}
