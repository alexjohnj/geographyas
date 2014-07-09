# By Alex Jackson. Last updated 2014-07-09
# MIT License
# Requirements:
# - Gadfly (https://dcjones.github.com/Gadfly.jl)
# - DataFrames (http://juliastats.github.io/DataFrames.jl)

# This script loads the (fake) hydrological data in `hydro-data.csv` and produces an SVG plot of it. 
# The plot produced requires editing in a vector editing program to make it suitable for the website. Edits include:
# - Increasing the thickness of the discharge curve
# - Adding transparency to precipitation bars (Gadfly doesn't accept an alpha value for colours)
# - Adding a discharge axis (Gadfly can't produce dual axes graphs and, as much as I hate them, hydrographs at AS level need two axes)
# - Adding annotations (Too much effort to do it with Gadfly)
# - Adding a legend (Too much effort to do it with Gadfly)
# - Resizing the graph so it is 1140 pixels wide (Gadfly seems to ignore the dimensions I specify)
# - Grouping axis labels correctly so the proper CSS is applied to them on the site

import Gadfly
import DataFrames

# Read the data
hydroData = DataFrames.readtable("hydro-data.csv")

# Create the Website's Graph Theme
dischargeTheme = Gadfly.Theme(default_color=Gadfly.color("#f2783c"))
precipitationTheme = Gadfly.Theme(default_color=Gadfly.color("#00bfff"))
graphTheme = Gadfly.Theme(minor_label_font="Lato", major_label_font="'Lato', 'Helvetica Neue', sans-serif")

# Make the precipitation and discharge layers
precipitationLayer = Gadfly.layer(hydroData, x="Elapsed Time", y="Precipitation", Gadfly.Geom.bar, precipitationTheme)
dischargeLayer = Gadfly.layer(hydroData, x="Elapsed Time", y="Discharge", Gadfly.Geom.smooth(method=:loess, smoothing=0.3), dischargeTheme)

# Plot them
plt = Gadfly.plot(dischargeLayer,
                  precipitationLayer, 
                  graphTheme, 
                  Gadfly.Scale.x_continuous(minvalue=0, maxvalue=38),
                  Gadfly.Guide.ylabel("Precipitation (mm)"),
                  Gadfly.Guide.xlabel("Time (hours)")
                  )

# Write out the SVG file
Gadfly.draw(Gadfly.SVG("hydrograph.svg", 1140Gadfly.px, 600Gadfly.px), plt)
