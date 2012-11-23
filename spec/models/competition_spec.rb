require 'spec_helper'

describe Competition do
  before :each do
    @competition = FactoryGirl.build(:competition)
    @user = @competition.user
  end

  it "has a valid factory" do
    @user.should be_valid
    @competition.should be_valid
  end

  it "should be invalid without a name" do
    #user = User.find(1)
    competition = @user.competitions.new(:name => nil, :endTime => (DateTime.now + 10.years), :startTime => (DateTime.now + 9.years))
    competition.should_not be_valid
  end

  it "should be invalid without a startTime" do
    #user = User.find(1)
    competition = @user.competitions.new(:name => "First Competition", :endTime => (Time.now + 10.years), :startTime => nil)
    competition.should_not be_valid
  end

  it "should be invalid without a end time" do
    #user = User.find(1)
    competition = @user.competitions.new(:name => "First Competition", :startTime => (Time.now + 10.years), :endTime => nil)
    competition.should_not be_valid
  end

  it "should have a valid start time" do
    competition = @user.competitions.new(:name => "First Competition", :startTime => (Time.now - 10.years), :endTime => (Time.now + 10.years))
    competition.should_not be_valid
  end

  it "should have a valid end time" do
    competition = @user.competitions.new(:name => "First Competition", :startTime => (Time.now + 10.years), :endTime => (Time.now - 10.years))
    competition.should_not be_valid
  end

end
