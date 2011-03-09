class Collection < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/
  validates_length_of :name, :maximum => 255
  
  
  # Create filters from the YAML
  def filters
    r = self.rules
    return [] if r.nil?
    
    YAML::load(r)
  end
  
  protected
  
  # Generate the products which belong to this Collection
  # - returns an array of ids
  # - filters can be organized into sections aiding ruby operations to be constructed later from them
  # - Ex:
  #   collections:
  #     - tags:
  #         - iphone
  #   number:
  #     - price:
  #         - gt: 0
  #         - lt: 100
  #   text:
  #     - name:
  #         - equals: 'alika'
  #     - description:
  #         - contains: 'for summer only'
  # - now it works only for tags and categories
  def generate_products
    ret = []
    Product.all.each do |p|
      self.filters.each do |key, value|
        ret << p.id if p.send(key) & value != []
      end
    end
    ret.uniq!
  end
end
