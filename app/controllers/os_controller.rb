class OsController < ApplicationController
  # GET /os
  # GET /os.xml
  def index
    @os = OS.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @os }
    end
  end

  # GET /os/1
  # GET /os/1.xml
  def show
    @os = OS.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @os }
    end
  end

  # GET /os/new
  # GET /os/new.xml
  def new
    @os = OS.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @os }
    end
  end

  # GET /os/1/edit
  def edit
    @os = OS.find(params[:id])
  end

  # POST /os
  # POST /os.xml
  def create
    @os = OS.new(params[:os])

    respond_to do |format|
      if @os.save
        format.html { redirect_to(@os, :notice => 'OS was successfully created.') }
        format.xml  { render :xml => @os, :status => :created, :location => @os }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @os.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /os/1
  # PUT /os/1.xml
  def update
    @os = OS.find(params[:id])

    respond_to do |format|
      if @os.update_attributes(params[:os])
        format.html { redirect_to(@os, :notice => 'OS was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @os.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /os/1
  # DELETE /os/1.xml
  def destroy
    @os = OS.find(params[:id])
    @os.destroy

    respond_to do |format|
      format.html { redirect_to(os_url) }
      format.xml  { head :ok }
    end
  end
end
