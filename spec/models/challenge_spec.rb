require 'spec_helper'

def valid_save(challenge)
  challenge.save
  challenge.should be_valid
end

def invalid_save(challenge)
  challenge.save
  challenge.should_not be_valid
end

describe Challenge do
  before :each do
    @challenge = FactoryGirl.build(:challenge)
  end

  it "has a valid factory" do
    valid_save(@challenge)
  end

  it "should validate the presence of its key attributes" do
    subject.should validate_presence_of(:title)
    subject.should validate_presence_of(:description)
    subject.should validate_presence_of(:start)
    subject.should validate_presence_of(:stop)
    subject.should validate_presence_of(:validation)
    subject.should validate_presence_of(:points)
  end
end
