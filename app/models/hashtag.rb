class Hashtag < ActiveRecord::Base
  belongs_to :tweet, foreign_key: 'tid'
end
