class ChallengeEntry < ActiveRecord::Base
  belongs_to :competition_entry
  belongs_to :challenge

  attr_accessible :complete
end
