class SessionController < ApplicationController
  #crud actions for session controller
  # GET /session/new
  def new
    @session = Session.new
  end

  # POST /session
  def create
    @session = Session.new(params[:session])
    if @session.save
      flash[:notice] = "Successfully created session."
      redirect_to @session
    else
      render :action => 'new'
    end
  end

  # GET /session/1
  def show
    @session = Session.find(params[:id])

  end

  # GET /session/1/edit
  def edit
    @session = Session.find(params[:id])

  end

  # PUT /session/1
  def update
    @session = Session.find(params[:id])
    if @session.update_attributes(params[:session])
      flash[:notice] = "Successfully updated session."
      redirect_to @session
    else
      render :action => 'edit'
    end
  end


end
