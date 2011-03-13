class AddNameToPerformances < ActiveRecord::Migration
  def self.up
    add_column :performances, :name, :string
  end

  def self.down
    remove_column :performances, :name
  end
end
