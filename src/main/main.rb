require_relative "./classes/Pizza"
require_relative "./classes/Topping"
require "json"
require 'io/console' 
require "colorize"
begin
    toppings_file = File.read("./data/toppings.json")
    toppings_hash = JSON.parse(toppings_file)

    # Welcome screen
    puts "Welcome to Domimo ^_^".on_blue
    puts "press any key to start an order"                                                                                                   
    STDIN.getch                                                                                                              
    puts ""

    # Pizza menu screen
    puts "What pizza do you want? Please choose from Hawaiian, Meat, Vegie, Seafood".on_blue
    pizza_name = gets
    pizza_name = pizza_name.upcase.strip #change the the input to uppercase and delete any space

    pizzas = ["HAWAIIAN", "MEAT", "VEGIE", "SEAFOOD"]
    while not pizzas.include?(pizza_name) 
        puts "Invalid pizza name. Please enter a valid pizza name".red
        pizza_name = gets
        pizza_name = pizza_name.upcase.strip
    end

    case pizza_name
    when "HAWAIIAN"
        pizza = Pizza.new("Hawaiian", 10)
    when "MEAT"
        pizza = Pizza.new("Meat", 15)
    when "VEGIE"
        pizza = Pizza.new("Vegie", 12)
    when "SEAFOOD"
        pizza = Pizza.new("Seafood", 20)
    else

        puts "An error happened. The pizza name is invalid." 
    end

    # Toppings menu screen
    puts "Do you want toppings? Please enter \"Yes\" or \"No\"".on_blue
    is_toppings = gets 
    is_toppings = is_toppings.upcase.strip

    while (is_toppings != "YES" and is_toppings != "NO")
        puts "Please enter \"Yes\" or \"No\" ".blue
        is_toppings = gets 
        is_toppings.upcase.strip
    end

    def add_toppings (toppings_hash_for_this_method, toppings)
        toppings_hash_for_this_method.each do |topping_name_key, topping_property_value|
            puts "Do you want to add #{topping_name_key}? Please enter amount from 0 to 3.".on_blue
            topping_quantity = gets

            while not (0..3).member?(topping_quantity.to_i)
                puts "Invalid input. Please enter a number from 0 to 3".red
                topping_quantity = gets
            end
            # Instantiate Topping class and initialize topping properties
            topping = Topping.new(topping_name_key, topping_property_value["price"], topping_quantity.to_i)
            toppings << topping     
        end
    end

    toppings = []
    if is_toppings == "YES"  
        add_toppings(toppings_hash, toppings)
        puts "Toppings added".blue
    else
        puts "No topping is added".red
    end
    pizza.toppings = toppings

    # Add pizza sauce screen
    puts "What pizza sauce do you want? Please choose from BBQ, Tomato, White".on_blue
    pizza_sauce = gets
    pizza_sauce = pizza_sauce.upcase.strip
    pizza_sauces = ["BBQ", "TOMATO", "WHITE"]
    while not pizza_sauces.include?(pizza_sauce) 
        puts "invalid pizza sauce, please enter a valid pizza sauce".red
        pizza_sauce = gets
        pizza_sauce = pizza_sauce.upcase.strip
    end

    case pizza_sauce
    when "BBQ"
        pizza.pizza_sauce = "BBQ"
    when "WHITE"
        pizza.pizza_sauce = "WHITE"
    when "TOMATO"
        pizza.pizza_sauce = "TOMATO"
    else
        #Xinyi note: Error handling normally the program won't go here, but if it happen, error need to be handled

    end

    # Add pizza base screen
    puts "What pizza base do you want? Please choose from Deep Pan and Crust".on_blue
    pizza_base = gets
    pizza_base = pizza_base.upcase.strip
    pizza_bases = ["DEEP PAN", "CRUST"]
    while not pizza_bases.include?(pizza_base) 
        puts "Invalid pizza base, please enter a valid pizza base".red
        pizza_base = gets
        pizza_base = pizza_base.upcase.strip
    end

    case pizza_base
    when "DEEP PAN"
        pizza.pizza_base = "Deep Pan"
    when "CRUST"
        pizza.pizza_base = "Crust"
    else
        puts "Invalid pizza base".red
        # Xinyi note: Can use error handling here
    end

    # Input customer information screen
    puts "Please enter your name".on_blue
    customer_name = gets
    puts "Please enter your address".on_blue
    customer_address = gets

    # Display order detail screen
    puts "You order is: ".magenta
    puts ""
    print "Pizza: "
    print pizza.name
    puts ""
    if is_toppings == "YES"
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
    print pizza.pizza_sauce
    puts ""
    print "Pizza base is: "
    print pizza.pizza_base
    puts ""
    
    print "Total price: $".green
    print pizza.calculate_total_price
    puts ""

rescue Errno::ENOENT
    puts "File not found.".red
end







