class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :p_name
      t.text :p_description
      t.decimal :p_price
      t.integer :p_quantify
      t.decimal :p_send
      t.boolean :p_avalible
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
