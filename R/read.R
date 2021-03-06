require(futile.logger)

#' Read the diabetes dataset
#'
#' Reads in all the individual patient files and consolidates into a single
#' data frame.
#'
#' @param bad Files with bad data
#' @param base The base path of the diabetes files
#' @return A data.frame of the merged files
read_diabetes <- function(bad=c(2,27,29,40),
    base='private/diabetes') {
  read_one <- function(i) {
    path <- sprintf('%s/data-%02i',base,i)
    flog.info("Loading file %s", path)
    classes <- c('character','character','numeric','numeric')
    o <- read.delim(path, header=FALSE, colClasses=classes)
    colnames(o) <- c('date','time','feature','value')
    o$date <- as.Date(o$date, format='%m-%d-%Y')
    o$id <- i
    o
  }
  idx <- 1:70
  do.call(rbind, lapply(idx[-bad], read_one))
}


