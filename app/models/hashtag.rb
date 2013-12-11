class Hashtag < ActiveRecord::Base
  # attr_accessor :text, :tid
  belongs_to :tweet, foreign_key: 'tid'
end
