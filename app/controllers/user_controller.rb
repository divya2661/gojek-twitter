class UserController < ApplicationController
 skip_before_action :verify_authenticity_token
	def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      render json: {user: @user, message:'OK', status: 200}, status: 200
    else
      render json: {user: @user, message: @user.errors.full_messages, status: 422}, status: 422
    end
  end

  def destroy
    id = params[:id]
    if User.delete(id) == 1
      render json: {message: 'OK', status: 200}, status: 200
    else
      render json: {message: 'UNSUCCESSFUL', status: 422}, status: 422
    end
  end
end

