class Competition < ActiveRecord::Base
  belongs_to :user
  attr_accessible :endTime, :startTime
end
