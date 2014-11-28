# Use this script to generate a graph of the world's population from 1800-2013.
# For the years 1800–1950, it uses estimated data from the US Census that is
# hard coded into the script. For the years 1961–2013, it uses the data in 
# `world-population-data.csv` from the World Bank.
#
# Post-processing:
#   - Change font stack and size of Geom.label point in SVG file.

using Gadfly, DataFrames, DataArrays

# Data from http://www.census.gov/population/international/data/worldpop/table_history.php
# Also, yay, hard-coding this in!
usCensusEstimateYears = [1800, 1850, 1900, 1910, 1920, 1930, 1940, 1950];
usCensusEstimate = [1125E6, 1402E6, 1762E6, 1750E6, 1860E6, 2070E6, 2300E6, 2558E6];

# Process the World Bank's Data
df = readtable("world-population-data.csv", skipstart=2);
worldRow = df[findfirst(df[:Country_Code], "WLD"), :];

# Delete unneeded columns
delete!(worldRow, :Country_Name);
delete!(worldRow, :Country_Code);
delete!(worldRow, :Indicator_Name);
delete!(worldRow, :Indicator_Code);
delete!(worldRow, :x2014);
delete!(worldRow, :x);

worldBankYear = zeros(length(worldRow));
worldBankPop = zeros(length(worldRow));

# Convert the DataFrame into two arrays that are a little easier to work with
# with Gadfly. Yucky, but I couldn't think of a better way. Seriously.
for i = 1:length(worldRow)
  worldBankYear[i] = 1960+i;
  worldBankPop[i] = worldRow[i][1];
end

# Plot all this stuff.
fontStack = "Lato, Helvetica Neue, Helvetica, Arial, sans-serif";
siteGraphTheme = Theme(
                       default_color=color("#e6550d"),
                       minor_label_font=fontStack,
                       major_label_font=fontStack,
                       minor_label_font_size=12px,
                       major_label_font_size=20px,
                       minor_label_color=color("#333333"),
                       major_label_color=color("#333333")
                      );

populationLayer = layer(
                        x=[usCensusEstimateYears, worldBankYear], 
                        y=[usCensusEstimate, worldBankPop]*1E-6, # Convert to millions of people
                        Geom.smooth(smoothing=0.5)
                       );

estimateRangeLayer = layer(
                           xintercept=[1800, 1950], 
                           Geom.vline(color=color("#7570b3"))
                          );

estimateAnnotationLayer = layer(
                                x=[1860], 
                                y=[7000],
                                label=["Estimated Data"], 
                                Geom.label
                               );

p = plot(
         populationLayer,
         estimateRangeLayer,
         estimateAnnotationLayer,
         siteGraphTheme,
         Scale.y_continuous(format=:plain),
         Guide.xlabel("Year"),
         Guide.ylabel("Population (Millions of People)"),
         Guide.title("World Population Growth from 1800–2013")
        );

display(p);
draw(SVG("../world-population-growth-graph-unedited.svg", 1140px, 600px), p);
draw(PNG("../world-population-growth-graph.png", 1140px, 600px), p);
