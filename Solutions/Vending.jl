module Vending

using Printf

export loop, initInventory

mutable struct Product
    name::String
    price::Int
    quantity::Int
end

const Inventory = Array{Product}

initInventory = [Product("Potato Chips", 299, 10)
                ,Product("Pocky", 199, 10)
                ,Product("Granola Bar", 250, 10)]

function printInventory(inventory::Inventory)
    join(stdout, map(pair -> begin
        (idx, x) = pair
        join(
            ["$idx "
            ,rpad(x.name, 15)
            ,"\$" * @sprintf("%.2f", x.price / 100)
            ,"\t"
            ,"$(x.quantity) left"]
        )
    end, zip(1:length(inventory), inventory)), "\n")
    println()
end

function loop(inventory::Inventory)
    while true
        println("Welcome to the Vending Machine")
        println("=================================")
        # input = readline()
        printInventory(inventory)
        println("=================================")
        println("Please enter the number of the product and the quantity separated by a space")
        input = []
        p = 0
        n = 0
        while true
            input = map(s -> parse(Int, s), split(readline()))
            length(input) != 2 && begin
                println("Wrong number of arguments.")
                continue
            end
            p, n = input
            (p > length(inventory) || p < 1) && begin
                println("Product number does not exist.")
                continue
            end
            n > inventory[p].quantity && begin
                println("Not enough in stock!")
                continue
            end
            break
        end
        @printf("Thank you, that will be \$%.2f.\n", inventory[p].price * n / 100)
        inventory[p].quantity -= n
        println()
    end
end

end