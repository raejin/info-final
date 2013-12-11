class HomeController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def related_hashtags
    # @hashtags = Hashtag.uniq.pluck(:text)
    @hashtags = Hashtag.count(:group => :text)
    @tweets = []
    if params[:hashtag]
      hashtagy = Hashtag.where(["text LIKE :query", {:query => "%#{params[:hashtag]}%"}])
      hashtagy.each do |h|
        @tweets << h.tweet
      end
    end
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
