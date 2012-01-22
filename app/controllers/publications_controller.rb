class PublicationsController < ApplicationController
before_filter :authenticate, :only => [:edit, :update]

  def new
   @publication = Publication.new
   @publishers = Publisher.all
   @title = "New Publication"
  end
  
  def create
   @publication = Publication.new(params[:publication])
   
   if @publication.save
      flash[:success] = "New publication was successfully added to data base"
      redirect_to @publication
    else
      @title = "New Publication"
      render 'new'
    end  
  end

  def show
   @publication = Publication.find(params[:id])
   @title = @publication.name
   @publishers = Publisher.find(@publication.publisher_id)
  end

  def edit
   @publication = Publication.find(params[:id])
   @publishers = Publisher.all
   @title = "Edit"
  end
  
  def update
   @publication = Publication.find(params[:id])
   if @publication.update_attributes(params[:publication])
      flash[:success] = "Publication's page was updated."
      redirect_to @publication
    else
      @title = "Edit"
      render 'edit'
    end
  end  
   
end
