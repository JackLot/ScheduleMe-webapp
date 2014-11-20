class User < ActiveRecord::Base
  attr_accessible :did, :email, :fname, :lname, :password, :phone
end
