Given /^I am on the Fourchal homepage$/ do
  visit('/')
end

And /^I should see the competition information$/ do
  page.should have_content "Competition was successfully created."
  page.should have_content "New competition"
  page.should have_content (@date - 1.day).strftime("%Y-01-%d")
  page.should have_content @date.strftime("%Y-01-%d")

end

And /^I fill in the new competition form$/ do
  @date = DateTime.now + 2.years
  within("#new_competition") do
    fill_in 'Name', :with => "New competition"
    select(@date.year, :from => 'competition_startTime_1i')
    select("January", :from => 'competition_startTime_2i')
    select(@date.day, :from => 'competition_startTime_3i')
    @date += 1.days
    select(@date.year, :from => 'competition_endTime_1i')
    select("January", :from => 'competition_endTime_2i')
    select(@date.day, :from => 'competition_endTime_3i')
  end
  click_button('Save')

end

And /^I click the "([^"]*)" button$/ do |button|
  click_button button
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
