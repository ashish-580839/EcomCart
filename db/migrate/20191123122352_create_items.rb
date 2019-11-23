class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.decimal :unit_price, precision: 8, scale: 2, null: false
      t.text :description, limit: 500

      t.timestamps
    end
  end
end
