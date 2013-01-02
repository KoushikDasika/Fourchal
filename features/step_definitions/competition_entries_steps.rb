def create_second_visitor
  @visitor = { :name => "Besty McUserton", :email => "Ilikecandy@yahoo.com",
    :password => "please", :password_confirmation => "please" }
end

def create_second_user
  create_second_visitor
  @user = FactoryGirl.create(:user, email: @visitor[:email])
end

And /^I create a second user$/ do
  create_second_user
  sign_up
end

And /^I accept the correct competition$/ do
  competition = Competition.last
  click_link("competition_#{competition.id}")
end
