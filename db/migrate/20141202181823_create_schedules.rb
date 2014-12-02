class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
    add_index :schedules, :user_id
  end
end
