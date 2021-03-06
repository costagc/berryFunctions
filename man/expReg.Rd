\name{expReg}
\alias{expReg}
\title{exponential regression with plotting}
\description{uses \code{\link{lm}}; plots data if add=FALSE, draws the regression line with \code{\link{abline}} and confidence interval with \code{\link{polygon}} and writes the formula with \code{\link{legend}}}
\usage{expReg(x, y=NULL, data=NULL, logy=TRUE, predictnew=NULL, interval="confidence",
plot=TRUE, digits=2, inset=0, xpd=par("xpd"), pos1="top", pos2=NULL, add=FALSE,
pch=16, col=rgb(0,0,0, 0.5), modcol=2, lwd=1, xlab=deparse(substitute(x)),
ylab=deparse(substitute(y)), main="exponential regression",
xlim=range(x), ylim=range(y), ...)}
\arguments{
  \item{x}{Numeric or formula (see examples). Vector with values of explanatory variable}
  \item{y}{Numeric. Vector with values of dependent variable. DEFAULT: NULL}
  \item{data}{Dataframe. If x is a formula, the according columns from data are used as x and y. DEFAULT: NULL}
  \item{logy}{Plot with a logarithmic y axis?  Calls \code{\link{logAxis}}. DEFAULT: TRUE}
  \item{predictnew}{Vector with values to predict outcome for. Passed as \code{newdata} to \code{\link{predict.lm}}. DEFAULT: NULL}
  \item{interval}{Inter val for prediction. DEFAULT: "confidence"}
  \item{plot}{Plot things at all? If FALSE, predictnew will still be returned. DEFAULT: TRUE}
  \item{digits}{Numeric vector of length \eqn{\ge 1}. Specifies number of digits a,b,r,e are rounded to in the formula "y=a*log(x)+b, R^2, RMSE=e", respectively. If values are not specified, they are set equal to the first. DEFAULT: 2}
  \item{inset}{Numeric vector of length \eqn{\le 2}. inset distance(s) from the margins as a fraction of the plot region when formula is placed by keyword. DEFAULT: 0}
  \item{xpd}{Logical, specifying wheter formula can be written only inside the plot region (when FALSE) or inside the figure region including mar (when TRUE) or in the entire device region including oma (when NA). DEFAULT: par("xpd")}
  \item{pos1}{\code{\link{xy.coords}}-acceptable position of the formula. DEFAULT: "top"}
  \item{pos2}{For numerical coordinates, this is the y-position. DEFAULT: NULL, as in \code{\link{legend}}}
  \item{add}{Logical. If TRUE, line and text are added to the existing graphic. DEFAULT: FALSE (plots datapoints first and then the line.)}
  \item{pch}{Point Character, see \code{\link{par}}. DEFAULT: 16}
  \item{col}{Color of points, see \code{\link{par}}. DEFAULT: rgb(0,0,0, 0.5)}
  \item{modcol}{color of model line. DEFAULT: 2}
  \item{lwd}{Numeric. Linewidth, see \code{\link{par}}. DEFAULT: 1}
  \item{xlab, ylab, main}{Character / Expression. axis label and graph title if add=FAlSE. DEFAULT: internal from names}
  \item{xlim, ylim}{graphic range. DEFAULT: range(x)}
  \item{\dots}{Further arguments passed to \code{\link{plot}} and \code{\link{abline}}.}
}
\value{\code{\link{predict.lm}} result.}
\author{Berry Boessenkool, \email{berry-b@gmx.de}, Dec. 2014}
\seealso{ \code{\link{lm}}, \code{\link{mReg}}, \code{\link{linReg}}.}
\examples{
x <- runif(100, 1, 10)
y <- 10^(x+rnorm(100, sd=0.2))
plot(x,y)
expReg(x,y)
expReg(x,y, logy=FALSE)
expReg(x,y, predictnew=6, plot=FALSE)
expReg(x,y, predictnew=3:6, interval="none", plot=FALSE)
}
\keyword{hplot}
\keyword{aplot}
\keyword{regression}
