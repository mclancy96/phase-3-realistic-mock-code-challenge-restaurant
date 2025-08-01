class Restaurant < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders

  def take_order(customer, dish_name, price)
    new_order = Order.create(dish_name: dish_name, price: price, customer: customer)
    new_order.save
  end

  def self.oldest_restaurant
    order(opening_year: :desc)
      .last
  end
end
