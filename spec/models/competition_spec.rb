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

  it "should validate the presence of its key attributes" do
    subject.should validate_presence_of(:name)
    subject.should validate_presence_of(:startTime)
    subject.should validate_presence_of(:endTime)
  end

  it "should have the startTime before the endTime" do
    competition = @user.competitions.create(:name => "First Competition", :startTime => (Time.now + 10.years), :endTime => (Time.now + 9.years))
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
