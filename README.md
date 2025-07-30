# Phase 3 Active Record Mock Code Challenge: Restaurant Order Tracker

## Learning Goals

- Write Active Record Migrations
- Connect between tables using Active Record Associations
- Write class and instance methods using Active Record
- Use Active Record to query the database

## Introduction

For this assignment, we'll be working with a restaurant domain.

As a restaurant manager, you need to keep track of customers, restaurants, and the orders placed by customers at different restaurants. Let's make an app that manages restaurant orders and tracks which customers have ordered from which restaurants.

We have three models: `Restaurant`, `Customer`, and `Order`

For our purposes, a `Restaurant` has many `Order`s, a `Customer` has many `Order`s, and an `Order` belongs to a `Customer` and to a `Restaurant`.

`Restaurant` - `Customer` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you start coding_. Remember to identify a single source of truth for your data.

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed in a suggested order, but you can feel free to tackle the ones you think are easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec` and you cannot run `learn test`. You'll need to create your own sample instances so that you can try out your code on your own. Make sure your associations and methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it, run `rake console` from the command line. This will start a `pry` session with your classes defined. You can test out the methods that you write here. You are also encouraged to use the `seeds.rb` file to create sample data to test your models and associations.

Writing error-free code is more important than completing all of the deliverables listed - prioritize writing methods that work over writing more methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First, prioritize getting things working. Then, if there is time at the end, refactor your code to adhere to best practices.

**Before you submit!** Save and run your code to verify that it works as you expect. If you have any methods that are not working yet, feel free to leave comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `Restaurant` and `Customer` models, and seed data for some `Restaurant`s and `Customer`s. The schema currently looks like this:

### restaurants Table

| Column       | Type    |
| ------------ | ------- |
| name         | String  |
| opening_year | Integer |

### customers Table

| Column | Type   |
| ------ | ------ |
| name   | String |

You will need to create the migration for the `orders` table using the attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class methods.

Remember: Active Record give your classes access to a lot of methods already! Keep in mind what methods Active Record gives you access to on each of your classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a migration for the `orders` table.

- An `Order` belongs to a `Customer`, and an `Order` also belongs to a `Restaurant`. In your migration, create any columns your `orders` table will need to establish these relationships using the right foreign keys.
- The `orders` table should also have:
  - A `dish_name` column that stores a string.
  - A `price` column that stores an integer.

After creating the `orders` table using a migration, use the `seeds.rb` file to create instances of your `Order` class so you can test your code.

**Once you've set up your `orders` table**, work on building out the following deliverables.

### Object Association Methods

Use Active Record association macros and Active Record query methods where appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

**Note**: The plural of "order" is "orders" and the singular of "orders" is "order".

#### Order

- `Order#customer`
  - returns the `Customer` instance for this Order
- `Order#restaurant`
  - returns the `Restaurant` instance for this Order

#### Restaurant

- `Restaurant#orders`
  - returns a collection of all the orders for the Restaurant
- `Restaurant#customers`
  - returns a collection of all the customers who have placed orders at the Restaurant

#### Customer

- `Customer#orders`
  - returns a collection of all the orders that the Customer has placed
- `Customer#restaurants`
  - returns a collection of all the restaurants that the Customer has ordered from

Use `rake console` and check that these methods work before proceeding. For example, you should be able to call `Customer.first.restaurants` and see a list of the restaurants for the first customer in the database based on your seed data; and `Order.first.customer` should return the customer for the first order in the database.

### Aggregate and Association Methods

#### Order

- `Order#print_details`
  - should return a string formatted as follows:
    `{insert customer's name} ordered {insert order's dish_name} from {insert restaurant's name}`

#### Restaurant

- `Restaurant#take_order(customer, dish_name, price)`
  - takes a `customer` (an instance of the `Customer` class), a `dish_name` (string), and a `price` as arguments, and creates a new `Order` instance associated with this restaurant and the given customer
- `Restaurant.oldest_restaurant`
  - returns the `Restaurant` instance with the earliest opening year

#### Customer

- `Customer#ordered_dish?(dish_name)`
  - accepts a `dish_name` (string) and returns true if any of the orders associated with the customer has that `dish_name`, otherwise returns false
- `Customer#transfer_order(customer, order)`
  - accepts a `Customer` instance and an `Order` instance, changes the order's customer to be the given customer; your code should only make the change if the order belongs to the customer who's transferring it
