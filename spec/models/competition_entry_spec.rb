require 'spec_helper'

describe CompetitionEntry do
  before :each do
    @competition = FactoryGirl.create(:competition)
    @user = @competition.user
    @user2 = FactoryGirl.create(:user,
                                :email => "user2@example.com")
  end

  it "has a valid factory" do
    @competition_entry = FactoryGirl.create(:competition_entry,
                                            :competition => @competition,
                                            :user => @user2)
    @competition_entry.should be_valid
  end

  it "is unique with respect to user and competition" do
    @competition_entry = FactoryGirl.create(:competition_entry,
                                            :competition_id => @competition,
                                            :user_id => @user2)
    competition_entry2 = FactoryGirl.build(:competition_entry,
                                            :competition_id => @competition,
                                            :user_id => @user2)
    competition_entry2.should_not be_valid
  end
end
