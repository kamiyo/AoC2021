# include("Solutions/vending.jl")
# import .Vending
include("Solutions/Day01.jl")
import .Day01

input = readlines(string("./Inputs/day", ARGS[1], ".txt"))

day = parse(Int, ARGS[1])
part = parse(Int, ARGS[2])

day == 1 && part == 1 && Day01.part1(input)
day == 1 && part == 2 && Day01.part2(input)