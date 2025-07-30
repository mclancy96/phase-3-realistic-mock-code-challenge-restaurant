#!/usr/bin/env ruby

# Simple test runner for the Library Book Tracker challenge
# Run this with: ruby test_runner.rb

require_relative 'config/environment'

puts "🏁 Starting Library Book Tracker Tests..."
puts "=" * 50

# Test 1: Basic model creation
puts "\n📝 Test 1: Testing basic model instantiation..."
begin
  library = Library.create(name: "Test Library", established_year: 2020)
  patron = Patron.create(name: "Test Patron")
  puts "✅ Library and Patron models work!"
rescue => e
  puts "❌ Error creating models: #{e.message}"
end

# Test 2: Check if Loan model exists and can be created
puts "\n📝 Test 2: Testing Loan model..."
begin
  # This will fail if the loans migration hasn't been created yet
  loan = Loan.create(book_title: "Test Book", due_date: "2025-08-01", patron_id: patron.id, library_id: library.id)
  puts "✅ Loan model works!"
rescue => e
  puts "❌ Loan model not ready: #{e.message}"
  puts "💡 Hint: You need to create the loans migration first!"
end

# Test 3: Check associations
puts "\n📝 Test 3: Testing model associations..."
begin
  if library.respond_to?(:loans) && library.respond_to?(:patrons)
    puts "✅ Library has loans and patrons associations!"
  else
    puts "❌ Library missing associations"
  end

  if patron.respond_to?(:loans) && patron.respond_to?(:libraries)
    puts "✅ Patron has loans and libraries associations!"
  else
    puts "❌ Patron missing associations"
  end

  if loan && loan.respond_to?(:patron) && loan.respond_to?(:library)
    puts "✅ Loan has patron and library associations!"
  else
    puts "❌ Loan missing associations"
  end
rescue => e
  puts "❌ Error testing associations: #{e.message}"
end

# Test 4: Check custom methods
puts "\n📝 Test 4: Testing custom methods..."
begin
  if library.respond_to?(:lend_book)
    puts "✅ Library#lend_book method exists!"
  else
    puts "❌ Library#lend_book method missing"
  end

  if Library.respond_to?(:oldest_library)
    puts "✅ Library.oldest_library method exists!"
  else
    puts "❌ Library.oldest_library method missing"
  end

  if patron.respond_to?(:borrowed_book?)
    puts "✅ Patron#borrowed_book? method exists!"
  else
    puts "❌ Patron#borrowed_book? method missing"
  end

  if loan && loan.respond_to?(:print_details)
    puts "✅ Loan#print_details method exists!"
  else
    puts "❌ Loan#print_details method missing"
  end
rescue => e
  puts "❌ Error testing custom methods: #{e.message}"
end

puts "\n" + "=" * 50
puts "🎯 Test complete! Use 'rake console' to test your methods manually."
puts "📖 Check the README.md for detailed requirements."
