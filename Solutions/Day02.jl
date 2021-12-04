module Day02

export part1, part2

function part1(input::Vector{String})
    commands::Vector{Vector{String}} = map(x -> split(x), input)
    horizontal = 0
    depth = 0
    for command in commands
        quantity = parse(Int, command[2])
        if (command[1] == "forward")
            horizontal = horizontal + quantity
        elseif (command[1] == "down")
            depth = depth + quantity
        elseif (command[1] == "up")
            depth = depth - quantity
        end
    end
    println(horizontal * depth)
end

function part2(input::Vector{String})
    commands::Vector{Vector{String}} = map(x -> split(x), input)
    horizontal = 0
    aim = 0
    depth = 0
    for command in commands
        quantity = parse(Int, command[2])
        if (command[1] == "forward")
            horizontal = horizontal + quantity
            depth = depth + aim * quantity
        elseif (command[1] == "down")
            aim = aim + quantity
        elseif (command[1] == "up")
            aim = aim - quantity
        end
    end
    println(horizontal * depth)
end

end