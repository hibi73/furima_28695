class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category, null: false
      t.integer :status, null: false
      t.integer :burden, null: false
      t.integer :region, null: false
      t.integer :days, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
