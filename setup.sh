#!/usr/bin/env bash

# Setup script for Library Book Tracker Challenge
echo "🏗️  Setting up Library Book Tracker Challenge..."

# Install dependencies
echo "📦 Installing gems..."
bundle install

# Run migrations
echo "🗄️  Setting up database..."
rake db:migrate

# Seed initial data
echo "🌱 Seeding initial data..."
rake db:seed

echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Read the README.md for challenge requirements"
echo "2. Create the loans migration: rake db:create_migration NAME=create_loans"
echo "3. Add associations to your models"
echo "4. Implement the required methods"
echo "5. Test your work with: ruby test_runner.rb"
echo "6. Use 'rake console' to test interactively"
echo ""
echo "🎯 Good luck with the challenge!"
