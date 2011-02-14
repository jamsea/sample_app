class UsersController < ApplicationController

#Runs the private methods "authenticate" and "correct_user" before index, edit, and update
  before_filter :authenticate, :only => [:index, :edit, :update]  
  before_filter :correct_user, :only =>  [:edit, :update]
 
  #Code that lists all the users on the "users" page
  def index
   @title = "All users"
   @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user  = User.new
    @title = "Sign up"
  end
  
 #If sign up was successful, flash a message, otherwise reload the sign up page
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user, :flash => { :success => "Thank you for signing up!" }
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

#Find the user, check if the update went through, if it did flash a success message, otherwise reload the edit page
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
  
    def authenticate
      deny_access unless signed_in?
    end
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
