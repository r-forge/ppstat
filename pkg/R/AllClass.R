setClass("Family",
         representation(
                        name = "character",
                        link = "character",       ## Name of the link, e.g. log if phi=exp
                        phi = "function",         ## The function that may be called the inverse link
                        Dphi = "function",        ## First derivative
                        D2phi= "function"         ## Second derivative
                       )
         )

setClass("PointProcess",
         representation(
                        call = "call",

                        ## The equidistant spacing between the g-evaluations.
                        Delta = "numeric",      

                        delta = "numeric",
                        family = "Family",
                        formula = "formula",
                        response = "character",

                        ## Results from call to 'optim' goes here.
                        optimResult = "list",
                        
                        ## The process data.
                        processData = "MarkedPointProcess",
                        
                        ## A vector c(a,b) with the support, [a,b], of the g-functions.
                        support = "numeric",     

                        "VIRTUAL")
         )

setClass("PointProcessModel",
         representation(
                        ## Evaluations of basis functions in support at Delta-grid values are in 
                        ## the list 'basis' in this environment.
                        basisEnv = "environment",
                        
                        ## The 'basisPoints' contains the evaluation points for the basis functions.
                        basisPoints = "numeric",
                        
                        coefficients = "numeric",
                        fixedCoefficients = "list",
                        
                        ## The 'active' columns. Set in update, used in getModelMatrix and reset in computeModelMAtrix
                        modelMatrixCol = "numeric",
                        
                        ## The modelMatrix as a 'Matrix' is in this environment. Locked after computation.
                        modelMatrixEnv = "environment",

                        Omega = "matrix",
                        penalization = "logical",
                        var = "matrix",
                        
                        ## Which method is used to compute the estimate of the variance. 'pointProcessModel' has default 'Fisher'.
                        varMethod = "character"      
                        ),
         contains="PointProcess",
         validity = function(object) {
           if(isTRUE(object@penalization) && !isTRUE(all.equal(min(eigen(object@Omega,only.values=TRUE,symmetric=TRUE)$values,0),0)))
             stop("Penalization matrix 'Omega' is not positive semi-definite.")
           if(isTRUE(object@support[2] - object@support[1] <= 0))
             stop("Variable 'support' has to be an interval.")
           if(isTRUE(object@Delta > object@support[2] - object@support[1]))
             stop("Variable 'Delta' has to be smaller than the length of the support.")
           return(TRUE)
         }
         )

setClass("PointProcessSmooth",
         contains="PointProcessModel"
         )