class HomeController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def related_hashtags
    # @hashtags = Hashtag.uniq.pluck(:text)
    @hashtags = Hashtag.uniq.pluck(:text)
  end

  def find_tweets_contain
    if params[:query].empty?
      redirect_to :root
    else
      @tweets = Tweet.where(["content LIKE :query", {:query => "%#{params[:query]}%"}])
      render 'index'
    end
  end
end
