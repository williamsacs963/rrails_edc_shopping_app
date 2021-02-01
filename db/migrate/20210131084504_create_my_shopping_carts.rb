class CreateMyShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :my_shopping_carts do |t|
      t.references :product, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
