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

  def who_updated
    @tweets = []
    Ios7Update.all.each do |update|
      @tweets << update.tweet
    end
  end

  def updated_sentiment
    @tweets = []
      if params[:sentiment] == 'positive'
        Ios7Update.all.each do |update|
          if update.tweet.sentiment == 1
            @tweets << update.tweet
          end
        end

      elsif params[:sentiment] == 'negative'
        Ios7Update.all.each do |update|
          if update.tweet.sentiment == -1
            @tweets << update.tweet
          end
        end

      elsif params[:sentiment] == 'neutral'
        Ios7Update.all.each do |update|
          if update.tweet.sentiment == 0
            @tweets << update.tweet
          end
        end

      else
        Ios7Update.all.each do |update|
          @tweets << update.tweet
        end
      end

    render 'who_updated'
  end
end
