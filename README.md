<!-- README.md is generated from README.Rmd. Please edit that file -->
Damn Fine Color Palettes
========================

![](figure/damnfine.gif)

> That's a damn fine plot, Diane - Special Agent Dale Cooper (probably)

The wesanderson package claimed that "Short of adding an owl and dressing up your plot in a bowler hat, here's the most indie thing you can do to one." So I took them up on that challenge and made the damnfinecolorpalette where the owls are not what they seem. First round of palettes derived from the video [Color By Numbers: Twin Peaks.](https://vimeo.com/218231355), the instagram [colorpalatte.cinema](https://www.instagram.com/colorpalette.cinema/), and the use for a color picker extension and screenshots. Concept and code based on the wonderful wesanderson palette generator.

Installation
------------

**Development version**

``` r
devtools::install_github("fbenamy/damnfinecolorpalette")
```

Usage
-----

``` r
library(damnfinecolorpalette)

# See all palettes
names(damnfinecolors)
#>  [1] "RedRoom1"     "RedRoom2"     "BeckyBriggs"  "LumberMill"  
#>  [5] "PhoneBooth"   "PeteMartell"  "OneEyedJacks" "RRDiner"     
#>  [9] "Dougie"       "AudreyHorne"  "LogLady"      "SpecialAgent"
```

Palettes
--------

### The Red Room

``` r
damnfine("RedRoom1")
```

![](figure/RedRoom-1.png)

``` r
damnfine("RedRoom2")
```

![](figure/RedRoom-2.png)

### Becky Briggs

``` r
damnfine("BeckyBriggs")
```

![](figure/unnamed-chunk-3-1.png)

### The Lumber Mill

``` r
damnfine("LumberMill")
```

![](figure/rushmore-1.png)

### Phone Booth

``` r
damnfine("PhoneBooth")
```

![](figure/unnamed-chunk-4-1.png)

### PeteMartell

``` r
damnfine("PeteMartell")
```

![](figure/unnamed-chunk-5-1.png)

### One Eyed Jacks

``` r
damnfine("OneEyedJacks")
```

![](figure/OneEyedJacks-1.png)

### RR Diner

``` r
damnfine("RRDiner")
```

![](figure/RRDiner-1.png)

### Dougie

``` r
damnfine("Dougie")
```

![](figure/Dougie-1.png)

### Audrey Horne

``` r
damnfine("AudreyHorne")
```

![](figure/Audrey%20Horne-1.png)

``` r
library("ggplot2")
ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar(color = "black") +
  scale_fill_manual(values = damnfine("AudreyHorne"))
```

![](figure/ggplot1-1.png)

### The Log Lady

``` r
damnfine("LogLady")
```

![](figure/Log%20Lady-1.png)

``` r
pal <- damnfine("LogLady", 21, type = "continuous")
image(volcano, col = pal)
```

![](figure/volcano-1.png)

``` r
pal <- damnfine("LogLady", 100, type = "continuous")
# heatmap is a local dataset
ggplot(heatmap, aes(x = X2, y = X1, fill = value)) +
  geom_tile() + 
  scale_fill_gradientn(colours = pal) + 
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) + 
  coord_equal() 
```

![](figure/log_lady_heatmap-1.png)

### Special Agent

``` r
damnfine("SpecialAgent")
```

![](figure/specialagent-1.png)
