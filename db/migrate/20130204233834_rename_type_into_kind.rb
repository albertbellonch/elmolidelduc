class RenameTypeIntoKind < ActiveRecord::Migration
  def self.up
    rename_column :images, :type, :kind
  end

  def self.down
    rename_column :images, :kind, :type
  end
end
