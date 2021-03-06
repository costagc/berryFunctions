\name{colPoints}
\alias{colPoints}
\title{Points colored relative to third dimension}
\description{
Draw colored points for 3D-data in a 2D-plane. Color is relative to third dimension, by different classification methods.
Can take 3 vectors or, as in \code{\link{image}}, 2 vectors and a matrix for z.}
\usage{colPoints(x, y, z, data, Range=range(z, finite=TRUE), method="equalinterval", breaks,
sdlab=1, col=rainbow2(cl$nbins), col2=c(NA, 1, 8),
legend=TRUE, legargs=NULL, hist=FALSE, histargs=NULL, add=TRUE, lines=FALSE, nint=30,
xlab=substitute(x), ylab=substitute(y), las=1, pch=16, quiet=FALSE, ...)}
\arguments{
  \item{x,y}{Vectors with coordinates of the points to be drawn}
  \item{z}{z values beloning to coordinates. Vector or matrix}
  \item{data}{ Optional: data.frame with the column names as given by x,y and z.}
  \item{Range}{Ends of color bar for method=equalinterval. DEFAULT: range(z, finite=TRUE)}
  \item{method}{Classification method (partial matching is performed), see \code{\link{classify}}. DEFAULT: "equalinterval")}
  \item{breaks}{Specification for method, see \code{\link{classify}}. DEFAULT: different defaults for each method}
  \item{sdlab}{Type of label and breakpoints if \code{method=standarddeviation}, see \code{\link{classify}}. DEFAULT: 1}
  \item{col}{Vector of colors to be used. DEFAULT: \code{\link{rainbow}} from blue (lowest) to red (highest value in Range)}
  \item{col2}{Color for points where z is NA, lower or higher than Range. DEFAULT: c(NA, 1, 8)}
  \item{legend}{Logical. Should a \code{\link{colPointsLegend}} be drawn? DEFAULT: TRUE}
  \item{legargs}{List. Arguments passed to \code{\link{colPointsLegend}}.  DEFAULT: NULL, with some defaults specified internally}
  \item{hist}{Logical. Should a \code{\link{colPointsHist}} be drawn? DEFAULT: FALSE (TRUE if histargs are given)}
  \item{histargs}{List. Arguments passed to \code{\link{colPointsHist}}. DEFAULT: NULL}
  \item{add}{Logical. Should the points be added to current (existing!) plot? If FALSE, a new plot is started. DEFAULT: TRUE (It's called col\bold{Points}, after all)}
  \item{lines}{Logical. Should lines be drawn underneath the points? (color of each \code{\link{segments}} is taken from starting point, last point is endpoint.) DEFAULT: FALSE}
  \item{nint}{Numeric of length 1. Number of interpolation points between each coordinate if \code{lines=TRUE}. nint=1 means no interpolation. Values below 10 will smooth coordinates and miss the original points!. DEFAULT: 30}
  \item{xlab}{x-axis label. DEFAULT: substitute as in plot}
  \item{ylab}{y-axis label. DEFAULT: ditto}
  \item{las}{Label Axis Style. Only used when add=FALSE. See \code{\link{par}}. DEFAULT: 1 (all labels horizontal)}
  \item{pch}{Point CHaracter. See \code{\link{par}}. DEFAULT: 16}
  \item{quiet}{Turn off warnings? DEFAULT: FALSE}
  \item{\dots}{Further graphical arguments passed to plot, points and lines, eg cex, xlim (when add=F), mgp, main, sub, asp (when add=F), etc. Note: col does not work, as it is already another argument}
}
\value{Invisible list of values that can be passed to colPointsLegend or colPointsHist.}
\note{Rstudio scales graphics really badly, so don't expect the right legend width out of the box if you use Rstudio! Exporting via \code{png("myplot.png", 600,400); colPoints(x,y,z); dev.off()} usually works much better}
\author{Berry Boessenkool, \email{berry-b@gmx.de}, 2011-2014. I'd be interested in hearing what you used the function for.}
\references{\url{http://uxblog.idvsolutions.com/2011/10/telling-truth.html}, \url{http://www.theusrus.de/blog/the-good-the-bad-22012/}}
\seealso{\code{\link{classify}}, \code{\link{colPointsLegend}}, \code{\link{colPointsHist}} }
\examples{
i <- c( 22,  40,  48,  60,  80,  70,  70,  63,  55,  48,  45,  40,  30,  32)
j <- c(  5,  10,  15,  20,  12,  30,  45,  40,  30,  36,  56,  33,  45,  23)
k <- c(175, 168, 163, 132, 120, 117, 110, 130, 131, 160, 105, 174, 190, 183)

# basic usage:
colPoints(i,j,k, cex=1.5, pch="+", add=FALSE)

# with custom Range (only for method equalinterval):
colPoints(i,j,k, cex=1.5, pch="+", add=FALSE, Range=c(150, 180))
# can be used to allow comparison between several plots
# points outside the range are plotted with col2

# with custom colors:
mycols <- colorRampPalette(c("blue","yellow","red"))(50)
colPoints(i,j,k, cex=1.5, pch="+", add=FALSE, col=mycols)

# With legend title:
colPoints(i,j,k, cex=2, pch="+", add=FALSE,
         legargs=list(density=FALSE, title="Elevation [m above NN.]"))
?colPointsLegend # to see which arguments can be set via legargs

# with lines (nint to change number of linear interpolation points):
colPoints(i,j,k, cex=1.5, add=FALSE, lines=TRUE, nint=10, lwd=2)
# With NAs separating lines:
tfile <- system.file("extdata/rivers.txt", package="berryFunctions")
rivers <- read.table(tfile, header=TRUE, dec=",")
colPoints(x,y,n, data=rivers, add=FALSE, lines=TRUE)

# different classification methods:
set.seed(007) ;  rx <- rnorm(30) ; ry <- rnorm(30) ; rz <- rnorm(30)*100
# sd: normal distribution
mycols <- colorRampPalette(c("green","yellow", "red"))
colPoints(rx,ry,rz, add=FALSE, col=mycols(5), method="s",
          legargs=list(horiz=FALSE, x1=80, x2=95))
colPoints(rx,ry,rz, add=FALSE, col=mycols(6), method="s", sdlab=2,
          legargs=list(horiz=FALSE, labelpos=5, lines=FALSE, title=""))
# quantiles: each color is equally often used
colPoints(rx,ry,rz, add=FALSE, method="q",
          legargs=list(horiz=FALSE, mar=c(0,5,3,0), bg="transparent") )
text(rx,ry,round(rz), col=8)


# With histogram:
colPoints(i,j,k, add=FALSE, hist=TRUE)
colPoints(i,j,k, cex=3.5, lwd=3, pch=1, histargs=list(bg=5, breaks=5), add=FALSE)
colPoints(rx,ry,rz, cex=3.5, lwd=3, pch=1, add=FALSE, legend=FALSE,
   histargs=list(mar=c(0,0,0,0), x1=50,y1=99, x2=100,y2=80, yaxt="n"))

# use classify separately:
text(rx,ry,round(rz), col=mycols(100)[classify(rz)$index], cex=0.7)

# histogram in lower panel:
layout(matrix(1:2), heights=c(8,4) )
colPoints(i,j,k, add=FALSE, legargs=list(y2=80))
colPointsHist(z=k, x1=10,y1=80, x2=100,y2=10)
layout(1)


# Customizing the legend :
colPoints(i,j,k, legend=FALSE, add=FALSE)
colPointsLegend(x1=20,y1=50, x2=95,y2=40, z=k, labelpos=5, atminmax=TRUE, bg=7)
colPointsLegend(x1=50,y1=28, x2=90,y2=18, z=k, Range=c(80, 200), nbins=12, font=3)
colPointsLegend(x1=10,y1=15, x2=40,y2= 5, z=k, labelpos=5, lines=FALSE, title="")

colPointsLegend(z=k, horizontal=FALSE)
colPointsLegend(x1=1, y1=90, z=k, horizontal=FALSE, labelpos=4, cex=1.2)
colPointsLegend(x1=23,y1=95, z=k, horizontal=FALSE, labelpos=5, cex=0.8,
  dens=FALSE, title="", at=c(130,150,170), labels=c("y","rr","Be"), lines=FALSE)
# For method other than colPoints' default, it is easiest to include these
# options as a list in legargs, but you can also use the invisible output
# from colPoints for later calls to colPointsLegend


# colPoints with matrix:
colPoints(z=volcano, add=FALSE)
# image and contour by default transpose the matrix! This is really in the data
colPointsHist(z=volcano)

# highlight local character of points on a regular grid normally drawn with image:
# library(datasets), normally already loaded in newer R versions.
z <- t(volcano)  ;  x <- 1:ncol(z)  ;  y <- 1:nrow(z)
colPoints(x,y,z, add=FALSE)  # takes matrix for z
contour(x,y,t(z), add=TRUE)

# image only takes a regular matrix, but not scatterpoints...
image(x,y,t(z), col=rev(rainbow(100, start=0, end=.7)))

# add single newly measured points to image (fictional data):
mx <- c( 22,  40,  80,  45,  60,  63,  30,  70)
my <- c(  5,  33,  12,  56,  20,  40,  45,  45)
mz <- c(135, 155, 120, 105, 140, 130, 190, 110)
colPoints(mx,my,mz, cex=5, pch="*", Range=c(94, 195), col2=NA, legend=FALSE)
points(mx,my, cex=4)
text(mx,my,mz, adj=-0.5, font=2)
}
\keyword{aplot}
\keyword{hplot}
\keyword{color}
