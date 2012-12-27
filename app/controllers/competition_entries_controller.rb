class CompetitionEntriesController < ApplicationController
  def index
    @competitions = CompetitionEntry.where(:competition_id => params[:competition_id])
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @competition_entry = CompetitionEntry.where(:user_id => current_user,
                                                :competition_id => @competition)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @competition_entry }
    end
  end

  def new
    @competition = Competition.find(params[:competition_id])
    @competition_entry = CompetitionEntry.where(:user_id => current_user,
                                                :competition_id => @competition)
    if @competition_entry.count == 0
      @competition_entry = @competition.competition_entries.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @competition_entry }
      end
    elsif @competition_entry.count == 1
      redirect_to edit_competition_competition_entry_path(@competition, @competition_entry.first)
    end
  end

  def create
    #@competition = Competition.find(params[:competition_id])
    @competition_entry = CompetitionEntry.create(:user_id => current_user,
                                                 :competition_id => params[:competition_id])

    respond_to do |format|
      if @competition_entry.save
        format.html { redirect_to edit_competition_competition_entry_path(@competition_entry.competition, @competition_entry), notice: 'Competition Entry was successfully created.' }
        format.json { render json: @competition_entry, status: :created, location: @competition_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @competition_entry.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @competition_entry = CompetitionEntry.find(params[:id])
    @competition = @competition_entry.competition
  end

  def update
    @competition_entry = CompetitionEntry.find(params[:id])

    respond_to do |format|
      if @competition_entry.update_attributes(params[:competition_entry])
        format.html { redirect_to edit_competition_competition_entry_path(@competition_entry.competition, @competition_entry), notice: 'Competition Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @competition_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end
end
