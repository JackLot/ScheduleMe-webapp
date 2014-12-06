class Membership < ActiveRecord::Base
	belongs_to :user, foreign_key: "did"
	belongs_to :group, foreign_key: "group_name"

  	attr_accessible :group_name, :did
end
