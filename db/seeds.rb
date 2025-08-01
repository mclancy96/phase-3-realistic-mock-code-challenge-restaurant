puts 'Creating restaurants...'
Restaurant.create(name: 'The Italian Corner', opening_year: 1995)
Restaurant.create(name: 'Burger Palace', opening_year: 2010)
Restaurant.create(name: 'Sushi Zen', opening_year: 2005)
Restaurant.create(name: 'Taco Fiesta', opening_year: 2018)
Restaurant.create(name: 'Sally Slices', opening_year: 2012)

puts 'Creating customers...'
Customer.create(name: 'Emily Rodriguez')
Customer.create(name: 'Michael Chen')
Customer.create(name: 'Sarah Thompson')
Customer.create(name: 'David Kim')
Customer.create(name: 'Stephen Mckeon')

puts 'Creating orders...'
Order.create(dish_name: "General Tso's", price: 10)
Order.create(dish_name: 'Pizza', price: 22)
Order.create(dish_name: 'Sushi', price: 13)
Order.create(dish_name: 'Turkey sub', price: 15)
Order.create(dish_name: 'Chicken parm', price: 25)

puts 'Seeding done!'
