class CompetitionEntriesController < ApplicationController
  def index
    @entry = CompetitionEntry.all
  end

  def show
    @competition = Competition.find(params[:competition_id])
  end

  def new
    @competition = Competition.find(params[:competition_id])
    @competition_entry = CompetitionEntry.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @competition_entry }
    end
  end

  def create

  end

  def edit
  end

  def update

  end

  def destory

  end
end
