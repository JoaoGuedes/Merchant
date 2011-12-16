class Collection < ActiveRecord::Base
  has_many :items, :dependent => :delete_all
  belongs_to :category
  belongs_to :user
  
  accepts_nested_attributes_for :items
  validates :title, :presence => {:message => 'cannot be blank.'}
end
