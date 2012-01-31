class TracksController < ApplicationController

  before_filter :login_required

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @user = current_user
    @track = Track.new(params[:track])
    @track.user = @user  #assign user of track
    if @track.save
      redirect_to @track, :notice => "Successfully created track."
    else
      render :action => 'new'
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      redirect_to @track, :notice  => "Successfully updated track."
    else
      render :action => 'edit'
    end
  end

  def vote
    @vote = Vote.new
    @track = Track.find(params[:id])
    @vote.user = current_user
    @vote.track = @track
    if @vote.save
      redirect_to @track, :notice => "Successfully voted."
    else
      redirect_to @track, :notice => "Vote failed."
    end


  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_url, :notice => "Successfully destroyed track."
  end

end
