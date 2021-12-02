module Day01

export part1, part2

function accumulator(acc, val)
    (val > 0) && acc + 1
    acc
end

function comparePrevious(depths::Vector{Int})
    count = 0
    depths = for idx in 2:length(depths)
        if (depths[idx] > depths[idx - 1])
            count = count + 1
        end
    end
    count
end

function part1(input::Vector{String})
    depths = map(x -> parse(Int, x), input)
    count = comparePrevious(depths)
    println(count)
end

function part2(input::Vector{String})
    depths = map(x -> parse(Int, x), input)
    movingAverage = Array{Int}(undef, length(depths) - 2)
    for idx in 1:(length(depths) - 2)
        movingAverage[idx] = sum(view(depths, idx:idx+2))
    end
    count = comparePrevious(movingAverage)
    println(count)
end

end