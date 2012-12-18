require 'spec_helper'

describe CompetitionEntry do
  before :each do
    @competition = FactoryGirl.create(:competition)
    @user = @competition.user
    @user2 = FactoryGirl.create(:user, :email => "user2@example.com")
  end

  it "has a valid factory" do
    @competitionEntry = FactoryGirl.create(:competition_entry, :competition => @competition, :user => @user2)
    @competitionEntry.should be_valid
  end
end
