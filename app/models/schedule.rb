class Schedule < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friday, :monday, :name, :thursday, :tuesday, :wednesday
end
