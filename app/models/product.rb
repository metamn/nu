class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :sku
  validates_format_of :name, :description, :sku, :with => /\A[a-zA-Z]+\z/
  validates_length_of :name, :sku, :maximum => 255
  validates_numericality_of :stock, :price  
  
   
  # Returns an array of tags, as strings
  def tags 
    yaml("tags")
  end
  
  # Returns an array of categories, as strings
  def categories
    yaml("categories")
  end
  
  protected
  
  # Create attributes from the YAML 
  # - returns the value for key from a YAML object
  # - if not found returns []
  def yaml(key)
    d = self.details
    return [] if d.nil?
    
    meta = YAML::load(d)
    meta[key]
  end
end


