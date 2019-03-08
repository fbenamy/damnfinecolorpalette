#' Complete list of palettes
#'
#' Use \code{\link{damnfine}} to construct palettes of desired length.
#'
#' @export
damnfinecolors <- list(
  RedRoom1 = c("#1C1003", "#74574E", "#3C2802", "#785828", "#C77928", "#5D110C", "#0E3442", "#436176",
              "#5A3630", "#6B5A67", "#9C878E"),
  RedRoom2 = c("#C2DDC7", "#5B1113", "#7A1317", "#62372D", "#110706",  "#A51A25", "#423330", "#E1B692", "#8D644E", "#D62639"),
  BeckyBriggs = c("#1E0002", "#490103", "#820308", "#AB070F", "#F06E73", "#FBB59E", "#F0A489", "#B9A270", "#C8923D", "#AF7443"),
  LumberMill = c("#492618", "#B3592E", "#747B7D", "#71473B", "#C97D59"),
  PhoneBooth = c("#1B1210", "#A43A15", "#FF6C29", "#F97453", "#F1AB9B", "#C1845E", "#FEF8D8"),
  PeteMartell = c("#562110", "#923616", "#5B4E2F", "#E68429", "#FBAD4D"),
  OneEyedJacks = c("#522B23", "#7E1F0E", "#D83418", "#E66A4E", "#FFCFA4"),
  RRDiner = c( "#f4c33a",'#8E1F1F',"#844526", "#84d6cc", "#EBDCE0"),
  Dougie = c("#1C1210", "#666B19", "#FAD0CB", "#25210E", "#A18068", "#593C27"),
  AudreyHorne = c( "#492E25", "#E66F5D", "#D24E3B", "#EE3A2F", "#D08B8E"),
  LogLady = c("#dd0d2c", "#E2B8A3", "#749092", "#72502E" , "#310A15"),
  SpecialAgent = c("#A41822", "#FFFFFF", "#16080B", "#555051")
)

#' A Twin Peaks palette generator
#'
#' These are color palettes from the television show Twin Peaks and the movie
#' Fire Walk with Me.
#'
#' @param n Number of colors desired. RedRoom1, LumberMill, PhoneBooth,
#' PeteMartell and OneEyedJacks color schemes are from the video
#'  \href{https://vimeo.com/218231355}{Color by Numbers: Twin Peaks}.. BeckyBriggs and
#' RedRoom2 are from the instagram
#' \href{https://www.instagram.com/colorpalette.cinema/}{colorpalette.cinema}
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
