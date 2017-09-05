class UserController < ApplicationController
  def create
    puts params
    @user = User.create!(name: params[:name], email: params[:email])
    render json: @user, status: :created
  end
end

