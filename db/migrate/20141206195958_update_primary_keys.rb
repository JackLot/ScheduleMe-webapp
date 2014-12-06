class UpdatePrimaryKeys < ActiveRecord::Migration
  def up
  	remove_column :groups, :id
  	remove_column :users, :id
  	execute "ALTER TABLE groups ADD PRIMARY KEY (name);"
  	execute "ALTER TABLE users ADD PRIMARY KEY (did);"
  end
end
