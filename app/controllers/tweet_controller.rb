class TweetController < ApplicationController
  layout "tweetpage"
  skip_before_action :verify_authenticity_token
  def index
    @tweet_props = {message:"", userId: ""}
  end

  def create
    @tweet = Tweet.new(user_id: params[:user_id], message: params[:message])
    if !@tweet.valid?
      render json: {status: 422, message: 'un-processable entity'}, status: 422
    elsif @tweet.save
      render json: {status: 200, message: 'success'}, status: 200
    else
      render json: {status: 500, message: 'internal_server_error'}, status: 500
    end
  end
  
end
