class ScriptVotesController < ApplicationController
  # GET /script_votes
  # GET /script_votes.xml
  def index
    @script_votes = ScriptVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @script_votes }
    end
  end

  # GET /script_votes/1
  # GET /script_votes/1.xml
  def show
    @script_vote = ScriptVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @script_vote }
    end
  end

  # GET /script_votes/new
  # GET /script_votes/new.xml
  def new
    @script_vote = ScriptVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @script_vote }
    end
  end

  # GET /script_votes/1/edit
  def edit
    @script_vote = ScriptVote.find(params[:id])
  end

  # POST /script_votes
  # POST /script_votes.xml
  def create
    @script_vote = ScriptVote.new(params[:script_vote])

    respond_to do |format|
      if @script_vote.save
        format.html { redirect_to(@script_vote, :notice => 'ScriptVote was successfully created.') }
        format.xml  { render :xml => @script_vote, :status => :created, :location => @script_vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @script_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /script_votes/1
  # PUT /script_votes/1.xml
  def update
    @script_vote = ScriptVote.find(params[:id])

    respond_to do |format|
      if @script_vote.update_attributes(params[:script_vote])
        format.html { redirect_to(@script_vote, :notice => 'ScriptVote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @script_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /script_votes/1
  # DELETE /script_votes/1.xml
  def destroy
    @script_vote = ScriptVote.find(params[:id])
    @script_vote.destroy

    respond_to do |format|
      format.html { redirect_to(script_votes_url) }
      format.xml  { head :ok }
    end
  end
end
