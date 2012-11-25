class Challenge < ActiveRecord::Base
  belongs_to :competition
  attr_accessible :badge, :complete, :description, :limit, :points, :prize, :start, :stop, :title, :validation
end
