\name{PointProcess-class}
\docType{class}
\alias{PointProcess-class}
\alias{computeMinusLogLikelihood,PointProcess-method}
\alias{computeMinusLogLikelihood}
\alias{formula,PointProcess-method}
\alias{formula<-,PointProcess,formula-method}
\alias{getProcessData,PointProcess-method}
\alias{setProcessData<-,PointProcess,ProcessData-method}


\title{Class "PointProcess"}
\description{
  
  This class is a virtual class. It implements general structures
  for generalized linear point process models. 
  
}
\section{Slots}{
  \describe{
    
    \item{\code{call}:}{a \code{"call"}. The call that
	created the point process model.}
      
    \item{\code{Delta}:}{a \code{"numeric"}. The
      equidistant spacings between basis function evaluations - within the
      support.}
    
    \item{\code{delta}:}{a \code{"numeric"}. The
      interdistances between the observation (time) points.}
    
    \item{\code{family}:}{an object of class \code{"Family"}. The family
      object specifying the specific interpretation of the formula
      specification.}
     
    \item{\code{formula}:}{a \code{"formula"}. The model
      formula specifying the model.}

    \item{\code{optimResult}:}{a \code{"list"} containing the results
      from a call to \code{optim}.}
    
    \item{\code{processDataEnv}:}{an environment used to store an object of
      class \code{"ProcessData"} - the model data.}
    
    \item{\code{support}:}{a \code{"numeric"}. The
      support, [a,b], of the linear filter functions as a vector of
      length 2, \code{support = c(a,b)}.}
  }
}
\section{Methods}{
  \describe{

    \item{computeMinusLogLikelihood}{\code{signature(model =
	"PointProcessModel")}: Computes the minus-log-likelihood
      function.}
    
    \item{formula}{\code{signature(model = "PointProcessModel")}: Returns
      the model formula.}

    \item{formula<-}{\code{signature(model = "PointProcessModel",
	value="formula")}: Sets the model formula.}
    
    \item{getProcessData}{\code{signature(model = "PointProcessModel")}: Returns
      the process data.}

    \item{setProcessData<-}{\code{signature(model = "PointProcessModel",
	value="ProcessData")}: Sets the process data.}
  
	 }
}

\author{Niels Richard Hansen, \email{Niels.R.Hansen@math.ku.dk}}

\seealso{\code{\link{pointProcessModel}}, \code{\linkS4class{PointProcessModel}}, \code{\linkS4class{ProcessData}}, \code{\link{formula}}.
}
\examples{
showClass("PointProcess")
}

\keyword{classes}