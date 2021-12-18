class Pizza
    @name #name for the type of the pizza you choosed
    @toppings = []
    @pizza_price #price for the pizza you ordered
    @pizza_sauce = "Tomato"
    @pizza_base = "Crust"

    def initialize (name,pizza_price)
        @name = name
        @pizza_price = pizza_price
    end

    def c 
        topping_price = 0
        for topping in @toppings do
            topping_price += topping.price * topping.amount
        end
        total_price = @pizza_price + topping_price
        return total_price
    end

    attr_accessor :toppings
    attr_accessor :pizza_sauce
    attr_accessor :pizza_base
    attr_reader :name
    attr_reader :pizza_price
end



