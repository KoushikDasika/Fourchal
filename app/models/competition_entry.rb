class CompetitionEntry < ActiveRecord::Base
  belongs_to :competition
  belongs_to :user
  # attr_accessible :title, :body
end
