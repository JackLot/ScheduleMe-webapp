class AddGroupUserHasManyRelationship < ActiveRecord::Migration
  def change
  	create_table :memberships do |t|
  		t.string :group_name
  		t.string :did
  	end
  end
end
