require 'spec_helper'

describe ChallengeEntry do
  before(:each) do
    @challenge_entry = FactoryGirl.create(:challenge_entry)
  end

  it "should have a valid factory" do
    @challenge_entry.should be_valid
  end
end
