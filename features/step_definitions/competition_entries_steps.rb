def create_second_visitor
  @visitor = { :name => "Besty McUserton", :email => "Ilikecandy@yahoo.com",
    :password => "please", :password_confirmation => "please" }
end

def create_second_user
  create_second_visitor
  @user = FactoryGirl.create(:user, email: @visitor[:email])
end

def delete_competition
  @competition ||= Competition.last
  @competition.destroy unless @competition.nil?
end

def create_competition
  @challenge = FactoryGirl.create(:challenge)
  @competition = @challenge.competition
end

And /^I create a second user$/ do
  create_second_user
  sign_up
end

And /^there exists a valid competition with challenges$/ do
  delete_competition
  create_user
  create_competition
end

And /^I accept the correct competition$/ do
  competition = Competition.last
  click_link("competition_#{competition.id}")
end

And /^I create a competition entry$/ do
  #visit("/competitions/#{@competition.id}/competition_entries/new")
  #debugger
  click_button("Save")
end
