class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
#Associations
	belongs_to :user
	embedded_in :chat

##Fields
 field :text, type: String
end
