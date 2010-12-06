class TestOutputVotesController < ApplicationController
  # GET /test_output_votes
  # GET /test_output_votes.xml
  def index
    @test_output_votes = TestOutputVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @test_output_votes }
    end
  end

  # GET /test_output_votes/1
  # GET /test_output_votes/1.xml
  def show
    @test_output_vote = TestOutputVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test_output_vote }
    end
  end

  # GET /test_output_votes/new
  # GET /test_output_votes/new.xml
  def new
    @test_output_vote = TestOutputVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test_output_vote }
    end
  end

  # GET /test_output_votes/1/edit
  def edit
    @test_output_vote = TestOutputVote.find(params[:id])
  end

  # POST /test_output_votes
  # POST /test_output_votes.xml
  def create
    @test_output_vote = TestOutputVote.new(params[:test_output_vote])

    respond_to do |format|
      if @test_output_vote.save
        format.html { redirect_to(@test_output_vote, :notice => 'TestOutputVote was successfully created.') }
        format.xml  { render :xml => @test_output_vote, :status => :created, :location => @test_output_vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_output_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_output_votes/1
  # PUT /test_output_votes/1.xml
  def update
    @test_output_vote = TestOutputVote.find(params[:id])

    respond_to do |format|
      if @test_output_vote.update_attributes(params[:test_output_vote])
        format.html { redirect_to(@test_output_vote, :notice => 'TestOutputVote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test_output_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_output_votes/1
  # DELETE /test_output_votes/1.xml
  def destroy
    @test_output_vote = TestOutputVote.find(params[:id])
    @test_output_vote.destroy

    respond_to do |format|
      format.html { redirect_to(test_output_votes_url) }
      format.xml  { head :ok }
    end
  end
end
