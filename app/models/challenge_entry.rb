class ChallengeEntry < ActiveRecord::Base
  belongs_to :competition_entry
  belongs_to :challenge

  attr_accessible :complete, :competition_entry_id, :challenge_id
end
