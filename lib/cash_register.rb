require 'pry'

class CashRegister

    attr_accessor :total, :discount, :title, :price, :quantity

    @@item_list = []

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @@item_list = []
    end


    def add_item(title, price, quantity = 1)
        counter = 0
        until counter == quantity
            @@item_list << title
            counter += 1
        end
        new_item = price * quantity
        @last_total = self.total
        self.total += new_item
    end

    def apply_discount
        # binding.pry
        if discount != 0
            new_discount = 100 - discount.to_f
            applied_discount = (self.total * (new_discount/100))
            self.total = applied_discount.to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @@item_list
    end

    def void_last_transaction
        @total = @last_total
    end
end


# #void_last_transaction - SEE LESSON FOR HINT
#   subtracts the last item from the total (FAILED - 12)
#   returns the total to 0.0 if all items have been removed (FAILED - 13)