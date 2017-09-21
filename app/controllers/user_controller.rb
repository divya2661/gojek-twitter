class UserController < ApplicationController
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      render json: {user: @user, message:'OK', status: 200}, status: 200
    else
      render json: {user: @user, message: @user.errors.full_messages, status: 422}, status: 422
    end
  end
end

