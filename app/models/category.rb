class Category < ActiveRecord::Base
  has_many :collections, :dependent => :delete_all
  validates :name, :presence => {:message => 'cannot be blank.'}
end
