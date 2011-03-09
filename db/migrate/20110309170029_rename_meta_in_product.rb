class RenameMetaInProduct < ActiveRecord::Migration
  def self.up
    rename_column :products, :detail, :details
  end

  def self.down
    rename_column :products, :details, :detail
  end
end
