require 'pry'
class CashRegister
    attr_accessor :total, :items
    attr_reader :discount, :title, :price, :quantity

    #@@items = []

    def initialize(discount=nil)
        #binding.pry
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title,price,quantity=nil)
        #binding.pry
        if quantity != nil
            self.total += (price*quantity)
            while quantity != 0
                quantity -= 1
                @items << title
            end 
            #binding.pry
        else
            self.total += price
            @items << title
        end
    end

    def apply_discount
        #binding.pry
        if discount != nil
            disc = self.total*discount/100
            self.total = self.total - disc
            #binding.pry
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end
   
    def items
        #binding.pry
        @items
    end

    def void_last_transaction
        self.total = 0
    end
end