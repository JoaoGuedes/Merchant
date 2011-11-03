class Photo < ActiveRecord::Base
  has_one :user, :dependent => :delete
  has_one :item, :dependent => :delete
end
