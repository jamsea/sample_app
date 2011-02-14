require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    
  before(:each) do
      @user = Factory(:user)
    end    
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end

  it "should have the right title" do
    get 'new'
    response.should have_selector("title", :content => "Sign up")
    end
    
  it "should find the right user" do
    get :show, :id => @user
    assigns(:user).should == @user
  end
    
  #Dunno where this goes
  class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end
  
  end
  
  
  
  end
end


