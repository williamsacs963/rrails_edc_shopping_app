# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  ip         :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShoppingCart < ApplicationRecord
    include AASM
    # Relaciones deben escribirse en plural
    has_many :my_shopping_carts, :dependent => :destroy 
    has_many :products, through: :my_shopping_carts
    
    # Uso de estados
    aasm column: "status" do
        state :create, initial: true
        state :payed
        event :pay do
            transitions from: :created, to: :payed
        end
    end
end
