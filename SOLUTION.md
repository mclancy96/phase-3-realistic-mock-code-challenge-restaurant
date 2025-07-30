# Phase 3 Active Record Mock Code Challenge: Library Book Tracker - SOLUTION

This file contains example solutions for the deliverables. Students should attempt the challenge before looking at these solutions.

## Model Associations

First, create the migration for the `loans` table:

```ruby
# db/migrate/20250730000003_create_loans.rb
class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.string :book_title
      t.string :due_date
      t.integer :patron_id
      t.integer :library_id
    end
  end
end
```

## Object Association Methods

### Library Model

```ruby
class Library < ActiveRecord::Base
  has_many :loans
  has_many :patrons, through: :loans

  def lend_book(patron, book_title, due_date)
    self.loans.create(patron: patron, book_title: book_title, due_date: due_date)
  end

  def self.oldest_library
    self.order(:established_year).first
  end
end
```

### Patron Model

```ruby
class Patron < ActiveRecord::Base
  has_many :loans
  has_many :libraries, through: :loans

  def borrowed_book?(book_title)
    self.loans.any? { |loan| loan.book_title == book_title }
  end

  def return_book(patron, loan)
    if loan.patron == self
      loan.update(patron: patron)
    end
  end
end
```

### Loan Model

```ruby
class Loan < ActiveRecord::Base
  belongs_to :patron
  belongs_to :library

  def print_details
    "#{self.patron.name} borrowed #{self.book_title} from #{self.library.name}"
  end
end
```

## Sample Seeds Data

```ruby
# Add to db/seeds.rb after creating the loans table

# Create some sample loans
alice = Patron.find_by(name: "Alice Johnson")
bob = Patron.find_by(name: "Bob Smith")
central = Library.find_by(name: "Central Public Library")
university = Library.find_by(name: "University Library")

Loan.create(patron: alice, library: central, book_title: "To Kill a Mockingbird", due_date: "2025-08-15")
Loan.create(patron: alice, library: university, book_title: "1984", due_date: "2025-08-20")
Loan.create(patron: bob, library: central, book_title: "The Great Gatsby", due_date: "2025-08-10")
Loan.create(patron: bob, library: university, book_title: "Pride and Prejudice", due_date: "2025-08-25")
```
