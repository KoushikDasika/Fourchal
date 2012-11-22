require 'spec_helper'

describe Competition do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "has a valid factory" do
    @user.should be_valid
  end

  it "should be invalid without a startTime" do
    #user = User.find(1)
    competition = @user.competitions.new(:endTime => (Time.now + 10.years), :startTime => nil)
    competition.should_not be_valid
  end

  it "should be invalid without a end time" do
    #user = User.find(1)
    competition = @user.competitions.new(:startTime => (Time.now + 10.years), :endTime => nil)
    competition.should_not be_valid
  end

  it "should have a valid start time" do
    competition = @user.competitions.new(:startTime => (Time.now - 10.years), :endTime => (Time.now + 10.years))
    competition.should_not be_valid
  end

  it "should have a valid end time" do
    competition = @user.competitions.new(:startTime => (Time.now + 10.years), :endTime => (Time.now - 10.years))
    competition.should_not be_valid
  end

end
