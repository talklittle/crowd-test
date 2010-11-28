class TagTasksController < ApplicationController
  # GET /tag_tasks
  # GET /tag_tasks.xml
  def index
    @tag_tasks = TagTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tag_tasks }
    end
  end

  # GET /tag_tasks/1
  # GET /tag_tasks/1.xml
  def show
    @tag_task = TagTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag_task }
    end
  end

  # GET /tag_tasks/new
  # GET /tag_tasks/new.xml
  def new
    @tag_task = TagTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag_task }
    end
  end

  # GET /tag_tasks/1/edit
  def edit
    @tag_task = TagTask.find(params[:id])
  end

  # POST /tag_tasks
  # POST /tag_tasks.xml
  def create
    @tag_task = TagTask.new(params[:tag_task])

    respond_to do |format|
      if @tag_task.save
        format.html { redirect_to(@tag_task, :notice => 'TagTask was successfully created.') }
        format.xml  { render :xml => @tag_task, :status => :created, :location => @tag_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tag_tasks/1
  # PUT /tag_tasks/1.xml
  def update
    @tag_task = TagTask.find(params[:id])

    respond_to do |format|
      if @tag_task.update_attributes(params[:tag_task])
        format.html { redirect_to(@tag_task, :notice => 'TagTask was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_tasks/1
  # DELETE /tag_tasks/1.xml
  def destroy
    @tag_task = TagTask.find(params[:id])
    @tag_task.destroy

    respond_to do |format|
      format.html { redirect_to(tag_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
