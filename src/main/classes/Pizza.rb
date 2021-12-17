class Pizza
    @name #name for the type of the pizza you choosed
    @toppings = []
    @pizzaPrice #price for the pizza you ordered
    @pizzaSauce = "Tomato"
    @pizzaBase = "Crust"

    def initialize (name,pizzaPrice)
        @name = name
        @pizzaPrice = pizzaPrice
    end

    def calculateTotalPrice
        totalPrice = @pizzaPrice
        toppingPrice = 0
        for topping in @toppings do
            toppingPrice += topping.price * topping.amount
        end
        totalPrice = @pizzaPrice + toppingPrice
        return totalPrice
    end

    attr_accessor :toppings
    attr_accessor :pizzaSauce
    attr_accessor :pizzaBase
    attr_reader :name
    attr_reader :pizzaPrice
end



