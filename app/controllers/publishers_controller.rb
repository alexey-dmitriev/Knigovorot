class PublishersController < ApplicationController
before_filter :authenticate, :only => [:edit, :update]
  def new
   @publisher = Publisher.new
   @title = "New Publisher" 
  end

  def create
   @publisher = Publisher.new(params[:publisher])
   if @publisher.save
      flash[:success] = "New publisher was successfully added to data base"
      redirect_to @book
    else
      @title = "New Publisher"
      render 'new'
    end  
  end
  
  def show
   @publisher = Publisher.find(params[:id])
   @publications = Publication.where("id = ?", @publisher.id)
   @title = @publisher.name  
  end

  def edit
   @publisher = Publisher.find(params[:id])
   @title = "Edit"
  end
 
  def update
   @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
      flash[:success] = "Publisher's page was successfully updated."
      redirect_to @publisher
    else
      @title = "Edit"
      render 'edit'
    end
  end

end
