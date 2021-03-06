\name{evalITR}
\alias{evalITR}
\title{Evaluate a Fitted ITR or A-ITR}
\description{
Evaluate the goodness of fit for predicted ITR or A-ITR.
}
\usage{
## S3 method for class "ITR"
evalITR(rule, a, y, p = 1/d[2])
}
\arguments{
\item{rule}{object of class inheriting from \code{"ITR"}.}
\item{a}{an optional 0-1 matrix with the same dimemsion of the first argument or a vector indicating the actual treaments the patients received.}
\item{y}{a numeric vector indicating the outcome after taking the treatment.}
\item{p}{a numeric vector with each element between 0 to 1, indicating the probability of the treatment been assigned to the patient.}
}
\value{
\code{evalFit} returns a numeric value indicating the expected outcome under the fitted rule.
}
\author{
\packageAuthor{aitr}
}
\examples{
data(sim1)
train = sim1[1:1000, ]
test = sim1[3001:5000, ]
res = itrFit(train[, 1:2], train[, 3], train[, 4], kernel = "polynomial", d = 4, lambda = 5^(4:11))

rule = predict(res, test[, 1:2], option = "normal")
evalITR(rule, test[, 3], test[, 4]) #evaluate prediction for ITR

rule = predict(res, test[, 1:2])
evalITR(rule, test[, 3], test[, 4]) #evaluate prediction for A-ITR
}