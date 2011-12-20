require 'open-uri'  
  
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password, :password_confirmation, :remember_me, :name,
  :city, :about, :photo

  #belongs_to :photo
    
  has_attached_file :photo,
    :styles =>{
      :thumb  => "50x50",
    },
    :storage => :s3,
    :bucket => 'Merchant',
    :default_url => '/missing_:style.png',
    :s3_credentials => {
      :access_key_id => 'AKIAI6OYMDHDZQTW2NOQ',
      :secret_access_key => '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'
    }
    
  has_many :collections, :dependent => :delete_all
  #has_many :messengers, :dependent => :delete_all
  #has_many :friends, :dependent => :delete_all
  validates :name, :email, :presence => {:message => 'cannot be blank.'}
  acts_as_network :users, :through => :invites, :conditions => "is_accepted = 't'"

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['raw_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      
      photo_url = URI.parse("http://graph.facebook.com/" + data["id"] + "/picture")             
      io = open(photo_url)
      
      def io.original_filename; base_uri.path.split('/').last; end      

      User.create!(:email => data["email"], :photo => io, :name => data["name"], :password => Devise.friendly_token[0,20]) 
      
    end
  end
  
  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end
  
  def get_new_invites_count
    invites_in.find(:all).select{|i|i.user_id_target = self}.select{|i|i.is_accepted!=true}.count
  end
  
  def has_not_reached(user)
    if (invites_in.where("user_id=?", user.id).count == 0 && self != user && users.include?(user) == false && invites_out.where("user_id_target=?", user.id).count == 0)
      true
    else
      false
    end
	end
end
