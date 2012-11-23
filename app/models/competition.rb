class Competition < ActiveRecord::Base
  belongs_to :user
  attr_accessible :endTime, :startTime, :name

  validates :user_id, :presence => true
  validates :endTime, :presence => true
  validates :startTime, :presence => true
  validates :name, :presence => true


  validate :start_date_cannot_be_in_the_past,
           :end_date_cannot_be_in_the_past,
           :dates_should_have_a_valid_range


  def start_date_cannot_be_in_the_past
    if !startTime.blank? and startTime < Time.now
      errors.add(:startTime, "Start Time can't be in the past")
    end
  end

  def end_date_cannot_be_in_the_past
    if !endTime.blank? and endTime < Time.now
      errors.add(:endTime, "End Time can't be in the past")
    end
  end

  def dates_should_have_a_valid_range
    if !startTime.blank? and !endTime.blank? and startTime >= endTime
      errors[:base] << "The start date needs to be before the end date"
    end
  end
end
