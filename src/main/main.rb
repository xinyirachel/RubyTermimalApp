require_relative "./classes/Pizza"
require_relative "./classes/Topping"
require "json"
require 'io/console' 

toppingsFile = File.read("./data/toppings.json")
toppingsHash = JSON.parse(toppingsFile)

puts toppingsHash

# Welcome screen
puts "Welcome to Domimo ^_^"
puts "press any key to start an order"                                                                                                    
STDIN.getch                                                                                                              
puts ""

# Menu screen
puts "What pizza do you want? Please choose from Hawaiian, Meat, Vegie, Seafood"
pizzaName = gets
pizzaName = pizzaName.upcase.strip #change the the input to uppercase and delete any space

pizzas = ["HAWAIIAN", "MEAT", "VEGIE", "SEAFOOD"]
while not pizzas.include?(pizzaName) 
    puts "Invalid pizza name. Please enter a valid pizza name"
    pizzaName = gets
    pizzaName = pizzaName.upcase.strip
end

case pizzaName
when "HAWAIIAN"
    pizza = Pizza.new("Hawaiian", 10)
when "MEAT"
    pizza = Pizza.new("Meat", 15)
when "VEGIE"
    pizza = Pizza.new("Vegie", 12)
when "SEAFOOD"
    pizza = Pizza.new("Seafood", 20)
else
    puts "invalid pizza name." # not gonna be use,  just default 

    # Xinyi note: place you can do error handling
end

# Add toppings screen
puts "Do you want toppings? Please enter \"Yes\" or \"No\""
isToppings = gets 
isToppings = isToppings.upcase.strip

while (isToppings != "YES" and isToppings != "NO")
    puts "Please enter \"Yes\" or \"No\" "
    isToppings = gets 
    isToppings.upcase.strip
end

def addToppings (toppingsHashForThisMethod, toppings)
    toppingsHashForThisMethod.each do |toppingNameKey, toppingPropertyValue|
        puts "Do you want to add #{toppingNameKey}? Please enter amount from 0 to 3."
        toppingQuantity = gets

        while not (0..3).member?(toppingQuantity.to_i)
            puts "Invalid input. Please enter a number from 0 to 3"
            toppingQuantity = gets
        end
        # Instantiate Topping class and initialize topping properties
        topping = Topping.new(toppingNameKey, toppingPropertyValue["price"], toppingQuantity.to_i)
        toppings << topping     
    end
end

toppings = []
if isToppings == "YES"  
    addToppings(toppingsHash, toppings)
    puts "Toppings added"
else
    puts "No topping is added"
end
pizza.toppings = toppings

# Add pizza sauce screen
puts "What pizza sauce do you want? Please choose from BBQ, Tomato, White"
pizzaSauce = gets
pizzaSauce = pizzaSauce.upcase.strip
pizzaSauces = ["BBQ", "TOMATO", "WHITE"]
while not pizzaSauces.include?(pizzaSauce) 
    puts "invalid pizza sauce, please enter a valid pizza sauce"
    pizzaSauce = gets
    pizzaSauce = pizzaSauce.upcase.strip
end

case pizzaSauce
when "BBQ"
    pizza.pizzaSauce = "BBQ"
when "WHITE"
    pizza.pizzaSauce = "WHITE"
when "TOMATO"
    pizza.pizzaSauce = "TOMATO"
else
    #Xinyi note: Error handling normally the program won't go here, but if it happen, error need to be handled

end

# Add pizza base screen
puts "What pizza base do you want? Please choose from Deep Pan and Crust"
pizzaBase = gets
pizzaBase = pizzaBase.upcase.strip
pizzaBases = ["DEEP PAN", "CRUST"]
while not pizzaBases.include?(pizzaBase) 
    puts "Invalid pizza base, please enter a valid pizza base"
    pizzaBase = gets
    pizzaBase = pizzaBase.upcase.strip
end

case pizzaBase
when "DEEP PAN"
    pizza.pizzaBase = "Deep Pan"
when "CRUST"
    pizza.pizzaBase = "Crust"
else
    puts "Invalid pizza base"
    # Xinyi note: Can use error handling here
end

# Input customer information screen
puts "Please enter your name"
customerName = gets
puts "Please enter your address"
customerAddress = gets

# Display order detail screen
puts "You order is: "
puts ""
print "Pizza: "
print pizza.name
puts ""
if isToppings == "YES"
    puts "Your toppings are: "
    pizza.toppings.each do |topping|
        print "    "
        print topping.name
        print " | "
        print topping.amount
        puts ""
    end
end
puts ""
print "Pizza sauce is: "
print pizza.pizzaSauce
puts ""
print "Pizza base is: "
print pizza.pizzaBase
puts ""
pizza.calculateTotalPrice
print "Total price: $"
print pizza.calculateTotalPrice
puts ""







