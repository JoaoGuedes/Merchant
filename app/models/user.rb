class User < ActiveRecord::Base
  has_many :collections, :dependent => :delete_all
  belongs_to :photo
end
