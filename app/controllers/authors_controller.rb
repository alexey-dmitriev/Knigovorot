class AuthorsController < ApplicationController
before_filter :authenticate, :only => [:edit, :update]
  
  def new
   @author  = Author.new
   @title = "New Author"
  end

  def create
   @author = Author.new(params[:author])
    if @author.save
      flash[:success] = "New Author was successfully added to data base"
      redirect_to @author
    else
      @title = "New Author"
      render 'new'
    end  
  end 

  def show
   @author = Author.find(params[:id])
   @author_books = Book.joins(:authors).where("authors.id = ?", @author.id)
  end

  def edit
   @author = Author.find(params[:id])
   @title = "Edit"
  end
 
  def update
   @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      flash[:success] = "Author's page was updated."
      redirect_to @author
    else
      @title = "Edit"
      render 'edit'
    end
  end

end
