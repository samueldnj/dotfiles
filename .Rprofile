# Sam Johnson's first .Rprofile (better late than never)
# Compiled from Kevin Ushey's blog post
# http://kevinushey.github.io/blog/2015/02/02/rprofile-essentials/

# Create separate environment
.__Rprofile.env__. <- attach(NULL, name = "local:rprofile")
# helpers for setting things in .__Rprofile.env__.
set <- function(name, value)
  assign(name, value, envir = .__Rprofile.env__.)

# Start timing
set(".Start.time", as.numeric(Sys.time()))


## Set CRAN repository
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cloud.r-project.org"
    options(repos = r)
})


# Load usethis and devtools
if (interactive()) {
  suppressMessages(require(devtools))
  suppressMessages(require(usethis))
}

# Set options for session
options(
  # devtools options
  "devtools.desc" = list( Author = "Samuel D. N. Johnson",
                          Maintainer = paste0("Samuel D. N. Johnson", " <", "samueldnjohnson@gmail.com", ">"),
                          License = "GPL3",
                          Version = "0.0.0.999"),

  "devtools.name" = "Samuel D. N. Johnson",

  # Max print lines
  max.print = 100,

  # Set default editor
  editor = "sublime",

  # Set screen width
  width = 80,
  
  # warn on partial matches
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchArgs = TRUE,

  # fancy quotes are annoying and lead to
  # 'copy + paste' bugs / frustrations
  useFancyQuotes = FALSE )


# Don't save environment
q <- function (save="no", ...) {
  quit(save=save, ...)
}



# enable autocompletions for package names in
# `require()`, `library()`
utils::rc.settings(ipck = TRUE)



### Use '.Rprofile' to quickly open your ~/.Rprofile

# generate some useful aliases, for editing common files
alias <- function(name, action) {
  placeholder <- structure(list(), class = sprintf("__%s__", name))
  assign(name, placeholder, envir = .__Rprofile.env__.)
  assign(sprintf("print.__%s__", name), action, envir = .__Rprofile.env__.)
}

# open .Rprofile for editing
alias(".Rprofile", function(...) file.edit("~/.Rprofile"))
alias(".Renviron", function(...) file.edit("~/.Renviron"))

# open Makevars for editing
alias("Makevars", function(...) {
  if (!utils::file_test("-d", "~/.R"))
    dir.create("~/.R")
  file.edit("~/.R/Makevars")
})

# Add pwd to environment
pwd <- ""
class(pwd) <- "__pwd__"
print.__pwd__ <- function(x, ...) print(getwd())
pwd

# always run Rcpp tests
Sys.setenv(RunAllRcppTests = "yes")

# ensure commonly-used packages are installed, loaded
quietly <- function(expr) {
  status <- FALSE
  suppressWarnings(suppressMessages(
    utils::capture.output(status <- expr)
  ))
  status
}

install <- function(package) {

  code <- sprintf(
    "utils::install.packages(%s, lib = %s, repos = %s)",
    shQuote(package),
    shQuote(.libPaths()[[1]]),
    shQuote(getOption("repos")[["CRAN"]])
  )

  R <- file.path(
    R.home("bin"),
    if (Sys.info()[["sysname"]] == "Windows") "R.exe" else "R"
  )

  con <- tempfile(fileext = ".R")
  writeLines(code, con = con)
  on.exit(unlink(con), add = TRUE)

  cmd <- paste(shQuote(R), "-f", shQuote(con))
  system(cmd, ignore.stdout = TRUE, ignore.stderr = TRUE)
}

packages <- c("devtools", "roxygen2", "knitr", "rmarkdown", "testthat")
invisible(lapply(packages, function(package) {

  if (quietly(require(package, character.only = TRUE, quietly = TRUE)))
    return()

  message("Installing '", package, "' ... ", appendLF = FALSE)
  install(package)

  success <- quietly(require(package, character.only = TRUE, quietly = TRUE))
  message(if (success) "OK" else "FAIL")

}))

