class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :class
      t.string :admin

      t.timestamps
    end
  end
end
