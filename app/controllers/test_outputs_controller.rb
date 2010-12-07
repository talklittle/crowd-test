class TestOutputsController < ApplicationController
  # GET /test_outputs
  # GET /test_outputs.xml
  def index
    @test_outputs = TestOutput.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @test_outputs }
    end
  end

  # GET /test_outputs/1
  # GET /test_outputs/1.xml
  def show
    @test_output = TestOutput.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test_output }
    end
  end

  # GET /test_outputs/new
  # GET /test_outputs/new.xml
  def new
    @test_output = TestOutput.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test_output }
    end
  end

  # GET /test_outputs/1/edit
  def edit
    @test_output = TestOutput.get(params[:id])
  end

  # POST /test_outputs
  # POST /test_outputs.xml
  def create
    @test_output = TestOutput.new(params[:test_output])

    respond_to do |format|
      if @test_output.save
        format.html { redirect_to(@test_output, :notice => 'TestOutput was successfully created.') }
        format.xml  { render :xml => @test_output, :status => :created, :location => @test_output }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_output.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_outputs/1
  # PUT /test_outputs/1.xml
  def update
    @test_output = TestOutput.get(params[:id])

    respond_to do |format|
      if @test_output.update_attributes(params[:test_output])
        format.html { redirect_to(@test_output, :notice => 'TestOutput was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test_output.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_outputs/1
  # DELETE /test_outputs/1.xml
  def destroy
    @test_output = TestOutput.get(params[:id])
    @test_output.destroy

    respond_to do |format|
      format.html { redirect_to(test_outputs_url) }
      format.xml  { head :ok }
    end
  end

  def upvote
    test_output = TestOutput.get(params[:id])
    user = User.get(params[:user_id])
    test_output.upvote(user)

    if request.xhr?
      render :text => "Upvoted"
    end
  end
end
