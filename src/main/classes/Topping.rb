class Topping
    @name
    @price
    @amount

    def initialize (name, price, amount)
        @name = name
        @price = price
        @amount = amount
    end

    attr_reader :name
    attr_reader :price
    attr_reader :amount

end