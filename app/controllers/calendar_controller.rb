include CalendarHelper

class CalendarController < ApplicationController
  def index

  end

  def show
  	 @did = params[:did]	
  	 @classes = get_classes(params[:did],"#3a87ad")

  	 respond_to do |format|
      format.html 
      format.json { render json: @classes }
    end
  end
end
