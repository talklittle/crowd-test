class CommentVotesController < ApplicationController
  # GET /comment_votes
  # GET /comment_votes.xml
  def index
    @comment_votes = CommentVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comment_votes }
    end
  end

  # GET /comment_votes/1
  # GET /comment_votes/1.xml
  def show
    @comment_vote = CommentVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment_vote }
    end
  end

  # GET /comment_votes/new
  # GET /comment_votes/new.xml
  def new
    @comment_vote = CommentVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment_vote }
    end
  end

  # GET /comment_votes/1/edit
  def edit
    @comment_vote = CommentVote.find(params[:id])
  end

  # POST /comment_votes
  # POST /comment_votes.xml
  def create
    @comment_vote = CommentVote.new(params[:comment_vote])

    respond_to do |format|
      if @comment_vote.save
        format.html { redirect_to(@comment_vote, :notice => 'CommentVote was successfully created.') }
        format.xml  { render :xml => @comment_vote, :status => :created, :location => @comment_vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comment_votes/1
  # PUT /comment_votes/1.xml
  def update
    @comment_vote = CommentVote.find(params[:id])

    respond_to do |format|
      if @comment_vote.update_attributes(params[:comment_vote])
        format.html { redirect_to(@comment_vote, :notice => 'CommentVote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_votes/1
  # DELETE /comment_votes/1.xml
  def destroy
    @comment_vote = CommentVote.find(params[:id])
    @comment_vote.destroy

    respond_to do |format|
      format.html { redirect_to(comment_votes_url) }
      format.xml  { head :ok }
    end
  end
end
