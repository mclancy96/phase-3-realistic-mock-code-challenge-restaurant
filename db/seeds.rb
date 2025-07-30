puts "Creating libraries..."
Library.create(name: "Central Public Library", established_year: 1901)
Library.create(name: "University Library", established_year: 1965)
Library.create(name: "Community Branch", established_year: 1988)
Library.create(name: "Children's Library", established_year: 2005)

puts "Creating patrons..."
Patron.create(name: "Alice Johnson")
Patron.create(name: "Bob Smith")
Patron.create(name: "Carol Wilson")
Patron.create(name: "David Brown")

puts "Creating loans..."

# ***************************************************************
# * TODO: create loans! Remember, a loan belongs to a patron   *
# * and a loan belongs to a library.                           *
# ***************************************************************
# Create loans Here

puts "Seeding done!"
