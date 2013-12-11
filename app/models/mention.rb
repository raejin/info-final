class Mention < ActiveRecord::Base
  # attr_accessor :uid, :tid

  belongs_to :user, foreign_key: 'uid'
  belongs_to :tweet, foreign_key: 'tid'

end
