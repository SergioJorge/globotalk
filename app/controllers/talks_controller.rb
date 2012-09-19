class TalksController < ApplicationController
  respond_to :html

  def index
    @talks = Talk.order_by_date
  end
  
  def new
    @talk = Talk.new
  end
  
  def create
    @talk = Talk.new(params[:talk])
    @talk.save
    unless @talk.save
      respond_with @talk
    else
      respond_with :root
    end
  end

  def edit
    #not implementd yet
    @talk = Talk.find(params[:id])
    respond_with @talk
  end
  
  def update
    #not implementd yet
    @talk = Talk.find(params[:id])
    if @talk.update_attributes(params[:talk])
      respond_with @talk
    else
      render :action => 'edit'
    end
  end
end
