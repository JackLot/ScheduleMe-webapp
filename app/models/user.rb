class User < ActiveRecord::Base
	has_many :memberships
	has_many :groups, :through => :memberships

  attr_accessible :did, :email, :fname, :lname, :password, :phone
end
