# Quick Reference Guide

## Project Structure

```
├── app/models/          # Model classes
│   ├── library.rb       # Library model
│   ├── patron.rb        # Patron model
│   └── loan.rb          # Loan model (you'll work on this)
├── config/              # Configuration files
│   ├── environment.rb   # Environment setup
│   └── database.yml     # Database configuration
├── db/                  # Database files
│   ├── migrate/         # Migration files
│   ├── seeds.rb         # Seed data
│   └── development.sqlite3  # Database file
├── README.md            # Challenge instructions
├── SOLUTION.md          # Sample solutions (check after attempting)
├── test_runner.rb       # Simple test script
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
- `ruby test_runner.rb` - Run simple tests

### Useful ActiveRecord Methods

- `Model.all` - Get all records
- `Model.first` - Get first record
- `Model.find(id)` - Find by ID
- `Model.find_by(attribute: value)` - Find by attribute
- `Model.create(attributes)` - Create new record
- `record.update(attributes)` - Update record

## Domain Overview

**Library** ←→ **Loan** ←→ **Patron**

- A Library has many Loans
- A Library has many Patrons through Loans
- A Patron has many Loans
- A Patron has many Libraries through Loans
- A Loan belongs to both a Library and a Patron

## Required Deliverables

1. ✅ Libraries and Patrons tables (already done)
2. ❌ Loans migration with: book_title, due_date, patron_id, library_id
3. ❌ Model associations using has_many, belongs_to, has_many through
4. ❌ Custom methods for each model

Check README.md for detailed requirements!
