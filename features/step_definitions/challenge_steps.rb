Given /^I add challenges to the competition form with the following values:$/ do |table|
  @table = table.raw
  @table.each do |row|
    click_link "Add a new challenge"

  end
end


