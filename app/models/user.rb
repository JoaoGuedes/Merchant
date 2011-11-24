class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password, :password_confirmation, :remember_me, :name,
  :city, :about, :photo_id
  
  belongs_to :photo
  has_many :collections
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['raw_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      profilephoto = Photo.create(:url_thumb => "http://graph.facebook.com/" + data["id"] + "/picture")
      User.create!(:email => data["email"], :photo_id => profilephoto.id, :name => data["name"], :password => Devise.friendly_token[0,20],) 
    end
  end
  
end
