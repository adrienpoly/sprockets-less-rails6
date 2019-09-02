# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, default: '', null: false
      t.string :sku, default: '', null: false
      t.string :image, default: '', null: false
      t.text :description, default: '', null: false
      t.integer :price_cents, default: 0, null: false

      t.timestamps
    end
  end
end
