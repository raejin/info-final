class Ios7Update < ActiveRecord::Base
  self.table_name = 'iOS7_update'

  belongs_to :user, foreign_key: 'uid'
  belongs_to :tweet, foreign_key: 'tid'


end
