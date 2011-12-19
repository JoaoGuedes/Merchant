class Item < ActiveRecord::Base
  belongs_to :photo
  belongs_to :collection
  attr_accessible :photo, :title, :description, :tradeable, :sellable
  has_attached_file :photo, 
    :styles =>{
      :thumb  => "64x64",
    },
    :storage => :s3,
    :bucket => 'MerchantCollections',
    :s3_credentials => {
      :access_key_id => 'AKIAI6OYMDHDZQTW2NOQ',
      :secret_access_key => '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'
    }
  validates :title, :presence => {:message => 'cannot be blank.'}
  before_destroy :check_collection
  
  def check_collection
    if self.collection.items.size == 1 || self.collection.items.all?{|item| item.marked_for_destruction? }
      self.errors[:base] << "A collection must have at least one item."
      false
    end
  end
  
  def url_thumb
          photo.url(:thumb)
  end
  
end
