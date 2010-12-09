class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/
  validates_length_of :name, :maximum => 255
  
  #TODO Regexp for title, html validations
  validates_format_of :description, :with => /\A[a-zA-Z]+\z/  
end
