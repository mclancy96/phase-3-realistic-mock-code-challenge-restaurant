class CreatePatrons < ActiveRecord::Migration[6.1]
  def change
    create_table :patrons do |t|
      t.string :name
    end
  end
end
