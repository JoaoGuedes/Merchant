class Item < ActiveRecord::Base
  belongs_to :photo
  belongs_to :collection
  
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
end
