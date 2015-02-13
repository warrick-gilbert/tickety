class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @user = User.new
    
  end
end
