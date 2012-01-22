class BooksController < ApplicationController
before_filter :authenticate, :only => [:edit, :update]
  def new
   @book  = Book.new
   @authors = Author.all
   @title = "New Book"
  end

  def create
   @book = Book.new(params[:book])
   @sel_authors = params[:selected_authors]
   @sql = ActiveRecord::Base.connection()
    if @book.save
      flash[:success] = "New book was successfully added to data base"
      @sel_authors.each do |i|
        @sql.execute("INSERT INTO authors_books VALUES (#{i},#{@book.id})")
      end
      redirect_to @book
    else
      @title = "New book"
      render 'new'
    end  
  end 
  
  def show
   @book = Book.find(params[:id])
   @title = @book.name   
   @book_author = Author.joins(:books).where("books.id =?",@book.id)
  end

  def edit
   @book = Book.find(params[:id])
   @book_author = Author.joins(:books).where("books.id =?",@book.id)
   @authors_ids = @book_author.collect do |i| i.id end
   @authors = Author.where("id NOT IN (?)", @authors_ids)
   @title = "Edit"
  end
 
  def update
   @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:success] = "Book page was updated."
      redirect_to @book
    else
      @title = "Edit"
      render 'edit'
    end
  end
  
end
