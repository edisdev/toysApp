class UsersController < ApplicationController
  before_action :authenticate_admin!, :except => [:show]

  def show
    @user = User.find(params[:id])
    @toys = Toy.where(user_id: @user.id)
  end
end
