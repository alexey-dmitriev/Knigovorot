class UsersController < ApplicationController
before_filter :authenticate, :only => [:edit, :update]
before_filter :correct_user, :only => [:edit, :update]


  def new
   @user = User.new
   @title = "Sign up"
  end

  def show
   @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to Knigovorot"
      UserMailer.welcome_email(@user).deliver
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
   @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

private



  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
  end

end
