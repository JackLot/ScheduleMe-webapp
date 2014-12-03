class CreateTestudos < ActiveRecord::Migration
  def change
    create_table :testudos do |t|
      t.string :classid
      t.string :classname
      t.integer :credits
      t.text :description
      t.integer :section
      t.string :instructor
      t.text :sectiondays
      t.text :starttimes
      t.text :endtimes
      t.text :building
      t.text :classroom

      t.timestamps
    end

    add_column :testudos, :did, :string
    add_index :testudos, :did
  end


end
