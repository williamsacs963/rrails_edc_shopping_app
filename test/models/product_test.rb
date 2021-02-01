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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
