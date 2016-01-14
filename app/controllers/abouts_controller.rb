class AboutsController < ApplicationController
  

  def show
    @about = About.find("1")
  end



  def update

  	@about = About.find("1")
  	@about.update(params[:about].permit(:body))
  	redirect_to @about

  end

  def edit
  	@about = About.find("1")
  end

end
