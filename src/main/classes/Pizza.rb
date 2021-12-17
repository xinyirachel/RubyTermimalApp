class Pizza
    @name #name for the type of the pizza you choosed
    @toppings
    @pizzaPrice #price for the pizza you ordered
    @pizzaBase
    @totalPrice

    def initialize (name,pizzaPrice)
        @name = name
        @pizzaPrice = pizzaPrice
    end

    def calculateTotalPrice ()
        totalPrice = @pizzaPrice
        toppingPrice = 0
        for topping in @toppings do
            toppingPrice += topping.price
        end
        totalPrice = @pizzaPrice + toppingPrice
    end

    attr_accessor :toppings
    attr_accessor :pizzaBase
    attr_reader :name
    attr_reader :basePrice

end



