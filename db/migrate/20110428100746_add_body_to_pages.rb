class AddBodyToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :body, :text
  end

  def self.down
    remove_column :pages, :body
  end
end
