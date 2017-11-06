class TweetController < ApplicationController
  def index
  end

  def create
    @tweet = Tweet.new(user_id: params[:user_id], message: [:message])
    if @tweet.save
      render json: {status: 200, message: 'OK'}
    else
      render json: {status: 500, message: 'internal_server_error'}
    end
  end
end
