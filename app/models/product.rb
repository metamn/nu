class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :sku
  validates_format_of :name, :description, :sku, :with => /\A[a-zA-Z]+\z/
  validates_length_of :name, :sku, :maximum => 255
  validates_numericality_of :stock, :price  
end
