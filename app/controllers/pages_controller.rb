class PagesController < ApplicationController
  def home
   @title = "Home"
  end

  def contact
   @title = "Contact"
  end

  def about
   @title = "About"
  end
   
  def news
   @title = "News"
  end

  def communication
   @title = "Communication"
  end

  def rates
   @title = "Rates"
  end

  def games
   @title = "Games"
  end

  def search_results
  @title="Search results"
  @search_res=Author.where("name like ?","%#{params[:search_query]}%")
  end
  
end
