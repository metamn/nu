require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should_not allow_value(".").for(:name)
  should ensure_length_of(:name).is_at_most(255)
  
  should_not allow_value(".").for(:description)
end
