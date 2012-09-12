class RemoveBodyFromPageContents < ActiveRecord::Migration
  def self.up
    remove_column :page_contents, :body
  end

  def self.down
  end
end
