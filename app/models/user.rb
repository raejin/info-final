class User < ActiveRecord::Base
  # attr_accessor :handle, :name, :description, :url, :time_zone, :followers_count, :friends_count, :created_at, :favorites_count

  has_many :tweets, foreign_key: 'uid'
  has_many :mentions, foreign_key: 'uid'

end
