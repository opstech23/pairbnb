class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :country
      t.string :state_or_province
      t.text :address
      t.integer :max_guests
      t.integer :price
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
