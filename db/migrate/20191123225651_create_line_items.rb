class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :item, null: false
      t.references :cart, null: false
      t.integer :quantity, default: 1

      t.decimal :unit_amount, precision: 8, scale: 2, null: false
      t.string :item_name, null: false



    end
  end
end
