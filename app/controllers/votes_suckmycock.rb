class VotesController < ApplicationController

  before_filter :login_required

	def new
	  @vote = Vote.new
  end

  def create
    #@user = current_user
    #@vote.user = @user  #assign user of track
    @vote = Track.new(params[:vote])
    @track = Track.find(params[:id])
   # @track.votes.count += 1

    if @track.save
      redirect_to @track, :notice => "Successfully voted."
    else
      render :action => 'new'
    end
  end

end
