using DataFrames
using CSV
using Statistics
using StatsPlots
using Plots
using Measures
using Pkg

Pkg.add("StatsPlots")

# Import from CSV
mpg = CSV.read("/Users/bd/Documents/W-UniversityOfSopron/Programozas/Julia/mpg.csv", DataFrame)

# Show Data
println(mpg)
println()

# Avg consumption in the City
println("Avg consumption in the City: ", mean(mpg[:, :cty]))
println()

# Avg consumption on the Highway
println("Avg consumption on the Highway: ", mean(mpg[:, :hwy]))
println()

# Different group by functions
by_manufacturer_mean_cty = combine(groupby(mpg, :manufacturer), :cty => mean)
println("By Manufacturer - Mean City Consumption:\n", by_manufacturer_mean_cty)
println()

by_manufacturer_mean_hwy = combine(groupby(mpg, :manufacturer), :hwy => mean)
println("By Manufacturer - Mean Highway Consumption:\n", by_manufacturer_mean_hwy)
println()

by_manufacturer_median_cty = combine(groupby(mpg, :manufacturer), :cty => median)
println("By Manufacturer - Median City Consumption:\n", by_manufacturer_median_cty)
println()

by_manufacturer_var_hwy = combine(groupby(mpg, :manufacturer), :hwy => var)
println("By Manufacturer - Highway Consumption Variance:\n", by_manufacturer_var_hwy)
println()

by_manufacturer_std_hwy = combine(groupby(mpg, :manufacturer), :hwy => std)
println("By Manufacturer - Highway Consumption Standard Deviation:\n", by_manufacturer_std_hwy)
println()

# Correlation Coefficients
correlation = cor(mpg[:, :displ], mpg[:, :hwy])
println("Correlation Coefficient between Engine Size and Highway Consumption:\n", correlation)
println()

# Diagram of Fuel consumption
@df mpg scatter(:displ, :hwy, group=:trans, size=(700, 700), alpha=0.5,
               xlabel="Engine size (L)", ylabel="Highway consumption (MPG = Miles Per Gallon)",
               title="Differences in fuel consumption (1999 and 2008)",
               facet=:year, legend=:topright)
