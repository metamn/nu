class ExtendProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :sku, :string
    add_column :products, :stock, :integer
    add_column :products, :price, :decimal
  end

  def self.down
    remove_column :products, :sku
    remove_column :products, :stock
    remove_column :products, :price
  end
end
