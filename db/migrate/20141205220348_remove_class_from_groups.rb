class RemoveClassFromGroups < ActiveRecord::Migration
  def up
    remove_column :groups, :class
  end

  def down
    add_column :groups, :class, :string
  end
end
