# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    has_many :has_categories, :dependent => :destroy
    has_many :products, through: :has_categories, :dependent => :destroy
  
    # Valdations
    validates :name, presence: true, length: {minimum: 6, too_short: "Minimo %{count} carácteres"}
    validates :description, presence: true, length: {minimum: 20, too_short: "Minimo %{count} carácteres"}
end
