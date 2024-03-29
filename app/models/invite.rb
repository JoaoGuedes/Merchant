class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_target, :class_name => 'User', :foreign_key => 'user_id_target'        # the target of the friend relationship 
  validates_presence_of :user, :user_target
end
