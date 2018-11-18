class Doubt
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short
	
#Associations
	belongs_to :user
	embeds_many :opinions

##Fields
 field :title, type: String
end
