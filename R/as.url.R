as.url <- function(x) {
  UseMethod("as.url")
}

as.url.url <- function(x) {
  x
}

as.url.character <- function(x) {
  if (is_url(x)) {
    x <- add_scheme(x)
  } else if ( is_port(x) ) {
    x <- paste0("http://localhost:", sub("^:", "", x))
  } else {
    x
  }
  if (!has_scheme(x)) {
    x <- add_scheme(x)
  }
  structure(x, class = "url")
}

as.url.numeric <- function(x) {
  as.url(as.character(x))
}
