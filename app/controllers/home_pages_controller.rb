class HomePagesController < ApplicationController

  skip_before_action :authenticate_user!

  def home
  end

  def help
  end

  def about
  end

  def signin
  end
  
  
end
