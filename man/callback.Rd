% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/callback.R
\docType{data}
\name{callback}
\alias{callback}
\alias{ChunkCallback}
\alias{SideEffectChunkCallback}
\alias{DataFrameCallback}
\alias{ListCallback}
\title{Callback classes}
\description{
These classes are used to define callback behaviors.
}
\details{
\describe{
\item{ChunkCallback}{Callback interface definition, all callback functions should inherit from this class.}
\item{SideEffectChunkCallback}{Callback function that is used only for side effects, no results are returned.}
\item{DataFrameCallback}{Callback function that combines each result together at the end.}
}
}
\examples{
## If given a regular function it is converted to a SideEffectChunkCallback

# view structure of each chunk
read_lines_chunked(readr_example("mtcars.csv"), str, chunk_size = 5)

# Print starting line of each chunk
f <- function(x, pos) print(pos)
read_lines_chunked(readr_example("mtcars.csv"), SideEffectChunkCallback$new(f), chunk_size = 5)

# If combined results are desired you can use the DataFrameCallback

# Cars with 3 gears
f <- function(x, pos) subset(x, gear == 3)
read_csv_chunked(readr_example("mtcars.csv"), DataFrameCallback$new(f), chunk_size = 5)

# The ListCallback can be used for more flexible output
f <- function(x, pos) x$mpg[x$hp > 100]
read_csv_chunked(readr_example("mtcars.csv"), ListCallback$new(f), chunk_size = 5)
}
\seealso{
Other chunked: \code{\link{read_delim_chunked}},
  \code{\link{read_lines_chunked}}
}
\concept{chunked}
\keyword{datasets}
\keyword{internal}
