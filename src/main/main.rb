require_relative "./classes/Pizza"
require_relative "./classes/Topping"
require "json"

toppingsFile = File.read("./data/toppings.json")
toppingsHash = JSON.parse(toppingsFile)

puts toppingsHash

# Welcome screen
puts "Welcome to Domimo ^_^"

require 'io/console'                                                                                                       
def continue_story                                                                                                               
  print "press any key to start an order"                                                                                                    
  STDIN.getch                                                                                                              
  print "            \r"                                                                                                              
end          

continue_story 

# Menu screen
puts "What pizza do you want? Options: Hawaiian, Meat, Vegie, Seafood"
pizzaName = gets
pizzaName = pizzaName.upcase.strip #change the the input to uppercase and delete any space

pizzas = ["HAWAIIAN", "MEAT", "VEGIE", "SEAFOOD"]
while not pizzas.include?(pizzaName) 
    puts "invalid pizza name"
    pizzaName = gets
    pizzaName = pizzaName.upcase.strip
end

case pizzaName.upcase.strip
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
end

puts "Do you want toppings? Please enter \"Yes\" or \"No\""
isToppings = gets 
isToppings = isToppings.upcase.strip

while (isToppings != "YES" and isToppings != "NO")
    puts "Please enter \"Yes\" or \"No\" "
    isToppings = gets 
    isToppings.upcase.strip
end

def addToppings (toppingsHashForThisMethod, pizzaForThisMethod)
    toppings = []
    toppingsHashForThisMethod.each do |toppingNameKey, toppingPropertyValue|
        puts "Do you want to add #{toppingNameKey}? Please enter amount from 0 to 3."
        toppingQuantity = gets

        while not (0..3).member?(toppingQuantity.to_i)
            puts "Invalid input. Please enter a number from 0 to 3"
            toppingQuantity = gets
        end
        # Instantiate Topping class and initialize topping properties
        topping = Topping.new(toppingNameKey, toppingPropertyValue["price"], toppingQuantity)
        toppings << topping     
    end
    puts "toppings array in addToppings method"
    puts toppings
    
    pizzaForThisMethod.toppings = toppings
end


if isToppings == "YES"  
    addToppings(toppingsHash, pizza)
    puts pizza.toppings
else
    puts "???"
end





