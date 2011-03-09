class AddMetaToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :detail, :text
  end

  def self.down
    remove_column :products, :detail
  end
end
