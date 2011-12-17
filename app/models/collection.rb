class Collection < ActiveRecord::Base
  has_many :items, :dependent => :delete_all
  belongs_to :category
  belongs_to :user
  
  accepts_nested_attributes_for :items
  validates :title, :presence => {:message => 'cannot be blank.'}
  validate :check_items
  
    def check_items
      if self.items.size < 1 || self.items.all?{|item| item.marked_for_destruction? }
        self.errors[:base] << "A collection must have at least one item."
      end
    end
end
