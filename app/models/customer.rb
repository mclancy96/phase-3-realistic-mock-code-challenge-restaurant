class Customer < ActiveRecord::Base
  has_many :orders
  has_many :restaurants, through: :orders

  def ordered_dish?(dish_name)
    orders.where(dish_name: dish_name).exists?
  end

  def transfer_order(new_customer, order)
    return unless self != new_customer

    new_customer.orders << order
    new_customer.save
  end
end
