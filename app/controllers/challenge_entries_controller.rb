class ChallengeEntriesController < ApplicationController

  def new
    @competition_entry = CompetitionEntry.find(params[:competition_entry_id])
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_entry = ChallengeEntry.new
  end

  def create
    @competition_entry = CompetitionEntry.find(params[:competition_entry_id])
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_entry = ChallengeEntry.new
    respond_to do |format|
      if params[:validation] == @challenge.validation
        @challenge_entry = ChallengeEntry.create(:competition_entry_id => @competition_entry,
                                                 :challenge_id => @challenge,
                                                 :complete => true,
                                                 :points => @challenge.points)
          if @challenge_entry.save
            format.html {
          redirect_to edit_competition_competition_entry_path(@competition_entry.competition, @competition_entry), :notice => "Great job! Challenge completed!"
    }
            format.json { render json: @competition_entry, status: :created, location: @competition }
          else
            format.html { render action: "new" , :notice => "Uh oh, couldn't be saved"}
            format.json { render json: @competition_entry.errors, status: :unprocessable_entity }
          end
      else
        format.html { render action: "new", :notice => "Your validation code is wrong!" }
        format.json { render json: @competition_entry.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end

  def index

  end
end
