class CompetitionEntry < ActiveRecord::Base
  belongs_to :competition
  belongs_to :user
  # attr_accessible :title, :body
  
  attr_accessible :user_id, :competition_id
  has_many :challenge_entries

  validates :user_id, :uniqueness => { :scope => :competition_id }
end

