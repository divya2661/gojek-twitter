class UserController < ApplicationController
  def create
    puts params
    @user = User.new(name: params[:name], email: params[:email])
    if (!@user.valid?)
      render json: {user: @user, message: 'user validation error', status: 400}, status: 400
    else
      if (!@user.save)
        render json: {user: @user, message:'internal server error', status: 500}, status: 500
      else
        render json: {user: @user, message:'OK', status: 200}, status: 200
      end
    end
  end
end

