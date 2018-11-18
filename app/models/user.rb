class User 
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Attributes::Dynamic
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable
  
  
  GENDER = ["male", "female", nil] 
  ROLES = {
    admin: 1,
    user: 2,
  }
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  ## App specific Data
  field :first_name,             :type => String
  field :last_name,              :type => String
  field :username,              :type => String
  field :authentication_token,   :type => String
  field :gender,                 :type => String
  field :avatar,                 :type => String
  field :zone_offset,            :type => Float
  field :height,                 :type => Float
  field :dob,                    :type => Date
  field :rating,                 :type => Float
  field :role,                   :type => Integer
  slug  :username,:scope => :_id

  ##Associations
  has_many :authorizations
  #has_one :profile
  #has_one :setting
  #has_many :chats
  #has_many :doubts  
  #has_many :opinions
  #has_many :comments, dependent: :destroy
  #has_and_belongs_to_many :friends, :class_name => "User"
  #has_and_belongs_to_many :followings, :class_name => "User", after_add: :add_friendship, after_remove: :remove_friendship
 
  def to_param
    slug
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.user_name || self.email
  end
  
  def followers
     User.in(:following_ids => self)
  end

  def following? user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    followings.include?(u)
  end

  def follower? user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    user.followings.include?(self)
  end

  def friend? user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    friends.include?(u)
  end

  def inverse_friend? user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    user.friends.include?(self)
  end

  def friend! user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    friends << u
  end

  def unfriend! user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    friends.delete(u)
  end

  def follow! user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    followings << u
  end

  def unfollow! user
    u = user.respond_to?(:id) ? user : User.where(:id => user).first
    followings.delete(u)
  end

  def age
    now = Time.now.utc.to_date
    (now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)) || 35
  end

  def admin?
    role == ROLES[:admin]
  end

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?
      user = current_user || User.where({email: auth["info"]["email"] }).first
      if user.blank?
       user = User.new
       user.password = Devise.friendly_token[0,10]
       user.first_name = auth.info.name
       user.email = auth.info.email
       if auth.provider == "twitter" 
         user.save(:validate => false) 
       else
         user.save
       end
     end
     authorization.username = auth.info.nickname
     authorization.user_id = user.id
     authorization.save
   end
   authorization.user
 end

private

  def add_friendship(user)
    #create notification
    notification = UserNotification.find_or_create_by(key: "Follow::User", trackable: user)
    notification.add_data(self, [user] ) if notification
    Resque.enqueue(App::Background::ScheduledTask::FollowNotification, user.id.to_s, self.id.to_s)
    
    # create friendship
    if following?(user) && user.follower?(self)
      user.friend!(self)
      friend!(user)
    end
  end

  def remove_friendship(user)
    if(friend?(user) && user.inverse_friend?(self))
      user.unfriend!(self)
      unfriend!(user)
    end
  end
end
