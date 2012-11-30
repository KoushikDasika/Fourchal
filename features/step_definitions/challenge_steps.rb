Given /^I add challenges to the competition form with the following values:$/ do |table|
  @table = table.raw
  puts @table
  @table[1..@table.length].each do |row|
    click_link "Add Challenge"
    fieldset = all('fieldset').last
    within(fieldset) do
      fill_in "Title", :with => row[0]
      fill_in "Description", :with => row[1]
      fill_in "Validation", :with => row[2]
      fill_in "Badge", :with => row[3]
      fill_in "Prize", :with => row[4]
      fill_in "Points", :with => row[5]
    end
  end
end

And /^I should see the challenges information:$/ do |table|
  @data = table.raw
  puts @data
  @data[1..@data.length].each do |row|
    row.each do |value|
      page.should have_content value
    end
  end
end
