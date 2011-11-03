class Item < ActiveRecord::Base
  belongs_to :photo
  belongs_to :collection
end
