class User < ActiveRecord::Base
	set_primary_key "did"

	has_many :memberships, foreign_key: "did"
	has_many :groups, :through => :memberships

  attr_accessible :did, :email, :fname, :lname, :password, :phone
end
