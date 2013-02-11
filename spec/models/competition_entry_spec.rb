require 'spec_helper'

describe CompetitionEntry do
  before :each do
    @competition = FactoryGirl.create(:competition)
    @user = FactoryGirl.create(:user,
                               :email => "user2@example.com")

    @competition_entry = FactoryGirl.create(:competition_entry,
                                            :competition => @competition,
                                            :user => @user)
  end

  it "has a valid factory" do
    @competition_entry.should be_valid
  end

  it "is unique with respect to user and competition" do
    competition_entry = FactoryGirl.build(:competition_entry,
                                            :competition => @competition,
                                            :user => @user)
    competition_entry.save
    competition_entry.should_not be_valid
  end
end
