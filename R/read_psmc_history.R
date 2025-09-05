read_psmc_history <- function(file) {
  df <- read.table(file, header = FALSE, sep = "", fill = TRUE, strip.white = TRUE)
  df <- df[, 1:2, drop = FALSE]  # keep only first two columns
  colnames(df) <- c("time", "Ne")
  return(df)
}
