# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_favorites_on_product_id  (product_id)
#  index_favorites_on_user_id     (user_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#  user_id     (user_id => users.id)
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validate :favorite_uniquess
  def set_product(product_id, user_id)
    @product = product.id
    @user = user_id
  end
  private
  def favorite_uniques
    favorite = Favorite.find_by(user_id:@user,product_id:@product)
    if !favorite.nil?
      errors.add(:favorites, "Este producto ya es favorito")
    end
  end
end
