class Category < ActiveRecord::Base
  has_many :collections, :dependent => :delete_all
end
