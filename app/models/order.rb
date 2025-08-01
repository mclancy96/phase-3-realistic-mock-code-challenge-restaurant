class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :restaurant

  def print_details
    "#{customer.name} ordered #{dish_name} from #{restaurant.name}"
  end
end
