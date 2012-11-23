Given /^I am on the Fourchal homepage$/ do
  visit('/')
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I create a valid competition$/ do
  user = find_user

  @competition = user.competitions.create(  :name => "first competition",
                                            :startTime => (DateTime.now + 1.days),
                                            :endTime => (DateTime.now + 2.days))

end

Then /^a competition should be created$/ do
  Competition.find(@competition.id).nil? == false
end

Then /^I should be directed to the login screen$/ do
  visit('/users/sign_in/')
end

When /^I create an invalid competition$/ do
  user = find_user
  @competition2 = user.competitions.create( :name => "first competition",
                                            :startTime => (DateTime.now - 1.days),
                                            :endTime => (DateTime.now + 2.days))
end

Then /^a competition should not be created$/ do
  @competition2.id.should == nil
end
