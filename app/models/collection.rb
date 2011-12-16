class Collection < ActiveRecord::Base
  has_many :items, :dependent => :delete_all
  belongs_to :category
  belongs_to :user
  
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  validates :title, :presence => {:message => 'cannot be blank.'}
end
