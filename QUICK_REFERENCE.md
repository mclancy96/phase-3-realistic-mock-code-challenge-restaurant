# Quick Reference Guide

## Project Structure

```
├── app/models/          # Model classes
│   ├── restaurant.rb    # Restaurant model
│   ├── customer.rb      # Customer model
│   └── order.rb         # Order model (you'll work on this)
├── config/              # Configuration files
│   ├── environment.rb   # Environment setup
│   └── database.yml     # Database configuration
├── db/                  # Database files
│   ├── migrate/         # Migration files
│   ├── seeds.rb         # Seed data
│   └── development.sqlite3  # Database file
├── README.md            # Challenge instructions
├── SOLUTION.md          # Sample solutions (check after attempting)
└── setup.sh             # Setup script
```

## Key Commands

### Setup

- `bundle install` - Install gems
- `./setup.sh` - Run full setup

### Database

- `rake db:migrate` - Run migrations
- `rake db:seed` - Seed data
- `rake db:create_migration NAME=migration_name` - Create new migration

### Testing

- `rake console` - Open interactive console

### Useful ActiveRecord Methods

- `Model.all` - Get all records
- `Model.first` - Get first record
- `Model.find(id)` - Find by ID
- `Model.find_by(attribute: value)` - Find by attribute
- `Model.create(attributes)` - Create new record
- `record.update(attributes)` - Update record

## Domain Overview

**Restaurant** ←→ **Order** ←→ **Customer**

- A Restaurant has many Orders
- A Restaurant has many Customers through Orders
- A Customer has many Orders
- A Customer has many Restaurants through Orders
- An Order belongs to both a Restaurant and a Customer

## Required Deliverables

1. ✅ Restaurants and Customers tables (already done)
2. ❌ Orders migration with: dish_name, price, customer_id, restaurant_id
3. ❌ Model associations using has_many, belongs_to, has_many through
4. ❌ Custom methods for each model

Check README.md for detailed requirements!
