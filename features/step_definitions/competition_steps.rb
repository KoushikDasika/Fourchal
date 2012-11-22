Given /^I am on the Fourchal homepage$/ do
  visit('/')
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I create a valid challenge$/ do
  user = find_user
  @competition = User.competitions.create(:startTime => (DateTime.now + 1.days),
                                         :endTime => (DateTime.now + 2.days))
end

Then /^a challenge should be created$/ do
  Competition.find(@competition.id).nil? == false
end

Then /^I should be directed to the login screen$/ do
  visit('/users/sign_in/')
end

When /^I create an invalid challenge$/ do
  user = find_user
  @competition = User.competitions.create(:startTime => (DateTime.now - 1.days),
                                         :endTime => (DateTime.now + 2.days))
end

Then /^a challenge should not be created$/ do
  Competition.find(@competition.id).nil? == true
end
