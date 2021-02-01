# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  p_avalible    :boolean
#  p_description :text
#  p_name        :string
#  p_price       :decimal(, )
#  p_quantify    :integer
#  p_send        :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Product < ApplicationRecord
  belongs_to :user
  has_many :has_categories, :dependent => :destroy
  has_many :categories, through: :has_categories, :dependent => :destroy
  after_create :save_categories
  validate :validate_categories

  # Valdations
  validates :p_name, presence: true, length: {minimum: 6, too_short: "Minimo %{count} carácteres"}
  validates :p_description, presence: true, length: {minimum: 20, too_short: "Minimo %{count} carácteres"}
  validates :p_price, presence: true, :numericality => true
  validates :p_send, presence: true, :numericality => true

  def categories=(value)
    @categories = value
  end

  def getCategories
    @categories
  end

  private
  def save_categories
    @categories.each do |category_id|
      HasCategory.create(category_id: category_id, product_id: self.id)
    end
  end

  def validate_categories
    if self.getCategories.blank? && self.id.nil?
      errors.add(:categories, "Debe agregar una categorria")
    end
  end

end
