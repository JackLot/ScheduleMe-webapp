class Group < ActiveRecord::Base
	set_primary_key "name"

	has_many :memberships, foreign_key: "group_name"
	has_many :users, :through => :memberships

  attr_accessible :admin, :class, :description, :name
end
