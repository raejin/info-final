class Tweet < ActiveRecord::Base
  # attr_accessor :uid, :content, :created_at, :source, :sentiment, :retweet_count, :favorite_count

  has_many :hashtags, foreign_key: 'tid'
  has_many :mentions, foreign_key: 'tid'

  belongs_to :user, foreign_key: 'uid'

end
