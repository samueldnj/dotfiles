# Sam Johnson's first .Rprofile (better late than never)
# Compiled from Kevin Ushey's blog post
# http://kevinushey.github.io/blog/2015/02/02/rprofile-essentials/

# Create separate environment
.__Rprofile_env__. <- new.env(parent = emptyenv())

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

# Set default editor
options(editor = "sublime")

# Set screen width
options(width = 80)

# Don't save environment
q <- function (save="no", ...) {
  quit(save=save, ...)
}

# warn on partial matches
options(warnPartialMatchAttr = TRUE,
        warnPartialMatchDollar = TRUE,
        warnPartialMatchArgs = TRUE)

# enable autocompletions for package names in
# `require()`, `library()`
utils::rc.settings(ipck = TRUE)

# fancy quotes are annoying and lead to
# 'copy + paste' bugs / frustrations
options(useFancyQuotes = FALSE)

### Use '.Rprofile' to quickly open your ~/.Rprofile

# Create an empty string with class '__Rprofile__'
# and assign it to our .__Rprofile.env__.
#
# Here, `class<-`() is just a sneaky way of creating
# an object with some class all in one expression.
assign(".Rprofile",
       `class<-`('', "__Rprofile__"),
       envir = .__Rprofile.env__.)

# Assign a print for the "__Rprofile__" class in that
# same environment. By printing the `.Rprofile` object,
# we actually go and edit it!
assign("print.__Rprofile__",
       function(x) file.edit("~/.Rprofile"),
       envir = .__Rprofile.env__.)

# Add pwd to environment
pwd <- ""
class(pwd) <- "__pwd__"
print.__pwd__ <- function(x, ...) print(getwd())
pwd


options("devtools.desc" = list(
  Author = Samuel D. N. Johnson,
  Maintainer = paste0(Samuel D. N. Johnson, " <", samueldnjohnson@gmail.com, ">"),
  License = "GPL3",
  Version = "0.0.0.999"
))
options("devtools.name" = Samuel D. N. Johnson)

# Max print lines
options(max.print = 100)


attach(.__Rprofile_env__.)