module Vending

export loop, initInventory

mutable struct Product
    name::String
    price::Int
    quantity::Int

const Inventory = Array{Product}

initInventory = [Product("Potato Chips", 299, 10)
                ,Product("Pocky", 199, 10)
                ,Product("Granola Bar", 250, 10)]

function printInventory(inventory::Inventory)
    join(map(x -> begin


    end, inventory))

function loop(inventory::Inventory)
    println("Welcome to the Vending Machine")
    println("=================================")
    # input = readline()
    display(inventory)
    input = []
    while true
        input = map(s -> parse(Int, s), split(readline()))
        length(input) == 2 && break
        println("Wrong number of arguments")
    end
    println(string(input))
end




end