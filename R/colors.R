#' Complete list of palettes
#'
#' Use \code{\link{damnfine}} to construct palettes of desired length.
#'
#' @export
damnfinecolors <- list(
  RedRoom = c("#1C1003", "#74574E", "#3C2802", "#785828", "#C77928", "#5D110C", "#0E3442", "#436176",
              "#5A3630", "#6B5A67", "#9C878E"),
  LumberMill = c("#492618", "#B3592E", "#747B7D", "#C97D59"),
  PhoneBooth = c("#1B1210", "#A43A15", "#FF6C29", "#F97453", "#F1AB9B", "#C1845E", "#FEF8D8"),
  PeteMartell = c("#562110", "#923616", "#5B4E2F", "#E68429", "#FBAD4D"),
  OneEyedJacks = c("#522B23", "#7E1F0E", "#D83418", "#E66A4E", "#FFCFA4")
)

#' A Twin Peaks palette generator
#'
#' These are color palettes from the television show Twin Peaks and the movie
#' Fire Walk with Me.
#'
#' @param n Number of colors desired. RedRoom, LumberMill, PhoneBooth,
#' PeteMartell and OneEyedJacks color schemes are from the most video
#'   \href{https://vimeo.com/218231355}{Color by Numbers: Twin Peaks}.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{RedRoom}, \code{LumberMill},  \code{PhoneBooth},
#'   \code{PeteMartell}, \code{OneEyedJacks}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' damnfine("RedRoom")
#' damnfine("OneEyedJacks")
#' damnfine("LumberMill")
#' damnfine("LumberMill", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- damnfine(21, name = "PhoneBooth", type = "continuous")
#' image(volcano, col = pal)
damnfine <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- damnfinecolors[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

#' heatmap
#'
#' A heatmap example
"heatmap"
