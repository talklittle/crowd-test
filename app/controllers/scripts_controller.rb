class ScriptsController < ApplicationController
  # GET /tasks/1/scripts
  # GET /tasks/1/scripts.xml
  def index
    if params[:task_id].nil?
      @scripts = Script.all
    else
      @scripts = Script.all(:task => { :id => params[:task_id] })
      @task = Task.find(params[:task_id])
    end

    if @task.nil?
      respond_to do |format|
        format.html { render 'scripts/empty' }
        format.xml  { render :xml => @scripts }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @scripts }
      end
    end
  end

  # GET /tasks/1/scripts/1
  # GET /tasks/1/scripts/1.xml
  def show
    @script = Script.find(params[:id])
    @task = Task.find(params[:task_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /tasks/1/scripts/new
  # GET /tasks/1/scripts/new.xml
  def new
    @script = Script.new
    @task = Task.find(params[:task_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /tasks/1/scripts/1/edit
  def edit
    @script = Script.find(params[:id])
    @task = Task.find(params[:task_id])
  end

  # POST /tasks/1/scripts
  # POST /tasks/1/scripts.xml
  def create
    @task = Task.find(params[:task_id])
    lang_info = params[:script].delete(:language)

    @script = @task.scripts.new(params[:script])

    # set the language
    language = Language.find(lang_info)
    if language.nil?
      language = Language.create(lang_info)
    end
    @script.language = language

    respond_to do |format|
      if @script.save
        format.html { redirect_to(task_script_url(@task, @script), :notice => 'Script was successfully created.') }
        format.xml  { render :xml => @script, :status => :created, :location => [@task, @script] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1/scripts/1
  # PUT /tasks/1/scripts/1.xml
  def update
    @script = Script.find(params[:id])
    @task = Task.find(params[:task_id])
    lang_info = params[:script].delete(:language)

    # set the language
    language = Language.find(lang_info)
    if language.nil?
      language = Language.create(lang_info)
    end
    @script.language = language

    respond_to do |format|
      if @script.update_attributes(params[:script])
        format.html { redirect_to(task_script_url(@task, @script), :notice => 'Script was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1/scripts/1
  # DELETE /tasks/1/scripts/1.xml
  def destroy
    @script = Script.find(params[:id])
    task = Task.find(params[:task_id])
    url = task_scripts_url(task)
    @script.destroy

    respond_to do |format|
      format.html { redirect_to(url) }
      format.xml  { head :ok }
    end
  end
end
