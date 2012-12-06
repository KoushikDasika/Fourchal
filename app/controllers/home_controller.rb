class HomeController < ApplicationController
  def index
    #@users = User.all
    @competitions = Competition.all(:order=> "created_at DESC")
    @entries = ChallengeEntry.find(:all, :conditions => {:complete => true})
  end
end
