require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times {@items << title}
    lItem = {}
    lItem[:title] = title
    lItem[:price] = price
    lItem[:quantity] = quantity
    self.last_transaction = lItem
  end

  def apply_discount
    if self.discount != 0
      self.total = self.total*(1-(self.discount.to_f/100.0))
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= last_transaction[:price]
    @items = @items[0..-1]
  end

end
