# source("R/read.R")
# source("R/explore.R")

# Section 2.2.2

#' Show the number of events per patient
#'
#' @examples
#' \dontrun{
#' df <- read_diabetes()
#' get_event_table(df)
#' }
get_event_table <- function(df) {
  table(df$id, df$feature)
}


# Features 33, 34, 58, 60, 62 are fairly dense
# 33: Regular insulin dose
# 34: NPH insulin dose
# 58: Pre-breakfast blood glucose measurement
# 60: Pre-lunch blood glucose measurement
# 62: Pre-supper blood glucose measurement

# Distribution of duration of study participation
# hist(get_patient_duration(df))
get_patient_duration <- function(df) {
  tapply(df$date, df$id, function(date) max(date) - min(date))
}


# Section 2.2.3

#' Filter out unused events
#'
#' df <- filter_events(df)
filter_events <- function(df) {
  keep <- c(33,34,58,60,62)
  df[df$feature %in% keep,]
}


