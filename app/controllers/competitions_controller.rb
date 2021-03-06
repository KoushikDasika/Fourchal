class CompetitionsController < ApplicationController
  # GET /competitions
  # GET /competitions.json
  before_filter :authenticate_user!, :except => [:show, :index]
  def index
    @competitions = Competition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @competitions }
    end
  end

  # GET /users/1/competitions/1
  # GET /users/1/competitions/1.json
  def show
    @competition = Competition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @competition }
    end
  end

  # GET /users/1/competitions/new
  # GET /users/1/competitions/new.json
  def new
    @competition = Competition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @competition }
    end
  end

  # GET /users/1/competitions/1/edit
  def edit
    @competition = Competition.find(params[:id])
  end

  # POST /users/1/competitions
  # POST /users/1/competitions.json
  def create
    @user = User.find(current_user)
    @competition = @user.competitions.create(params[:competition]) #:name => params[:name],
                                              #:startTime => params[:startTime],
                                              #:endTime => params[:endTime])

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'Competition was successfully created.' }
        format.json { render json: @competition, status: :created, location: @competition }
      else
        format.html { render action: "new" }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/competitions/1
  # PUT /users/1/competitions/1.json
  def update
    @competition = Competition.find(params[:id])

    respond_to do |format|
      if @competition.update_attributes(params[:competition])
        format.html { redirect_to @competition, notice: 'Competition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/competitions/1
  # DELETE /users/1/competitions/1.json
  def destroy
    @competition = Competition.find(params[:id])
    @competition.destroy

    respond_to do |format|
      format.html { redirect_to competitions_url }
      format.json { head :no_content }
    end
  end
end
