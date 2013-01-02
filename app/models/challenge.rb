class Challenge < ActiveRecord::Base
  belongs_to :competition
  has_many :challenge_entries

  attr_accessible :badge, :complete, :description, :limit,
                  :points, :prize, :start, :stop, :title, :validation, :competition_id

  validates :title, :description, #:start, :stop, 
            :validation, :points, :presence => true

  #validate :start_date_cannot_be_in_the_past,
  #         :end_date_cannot_be_in_the_past,
  #         :dates_should_have_a_valid_range


  def start_date_cannot_be_in_the_past
    if !start.blank? and start < Time.now
      errors.add(:start, "Start Time can't be in the past")
    end
  end

  def end_date_cannot_be_in_the_past
    if !stop.blank? and stop < Time.now
      errors.add(:stop, "End Time can't be in the past")
    end
  end

  def dates_should_have_a_valid_range
    if !start.blank? and !stop.blank? and start >= stop
      errors[:base] << "The start date needs to be before the end date"
    end
  end

end
