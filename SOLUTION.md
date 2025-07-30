# Phase 3 Active Record Mock Code Challenge: Restaurant Order Tracker - SOLUTION

This file contains example solutions for the deliverables. Students should attempt the challenge before looking at these solutions.

## Model Associations

First, create the migration for the `orders` table:

```ruby
# db/migrate/20250730000003_create_orders.rb
class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :dish_name
      t.integer :price
      t.integer :customer_id
      t.integer :restaurant_id
    end
  end
end
```

## Object Association Methods

### Restaurant Model

```ruby
class Restaurant < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders

  def take_order(customer, dish_name, price)
    self.orders.create(customer: customer, dish_name: dish_name, price: price)
  end

  def self.oldest_restaurant
    self.order(:opening_year).first
  end
end
```

### Customer Model

```ruby
class Customer < ActiveRecord::Base
  has_many :orders
  has_many :restaurants, through: :orders

  def ordered_dish?(dish_name)
    self.orders.any? { |order| order.dish_name == dish_name }
  end

  def transfer_order(customer, order)
    if order.customer == self
      order.update(customer: customer)
    end
  end
end
```

### Order Model

```ruby
class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :restaurant

  def print_details
    "#{self.customer.name} ordered #{self.dish_name} from #{self.restaurant.name}"
  end
end
```

## Sample Seeds Data

```ruby
# Add to db/seeds.rb after creating the orders table

# Create some sample orders
emily = Customer.find_by(name: "Emily Rodriguez")
michael = Customer.find_by(name: "Michael Chen")
italian_corner = Restaurant.find_by(name: "The Italian Corner")
burger_palace = Restaurant.find_by(name: "Burger Palace")

Order.create(customer: emily, restaurant: italian_corner, dish_name: "Spaghetti Carbonara", price: 18)
Order.create(customer: emily, restaurant: burger_palace, dish_name: "Classic Burger", price: 12)
Order.create(customer: michael, restaurant: italian_corner, dish_name: "Margherita Pizza", price: 16)
Order.create(customer: michael, restaurant: burger_palace, dish_name: "Cheese Fries", price: 8)
```
