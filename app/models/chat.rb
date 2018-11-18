class Chat
  include Mongoid::Document
  #Associations
	belongs_to :user
	embeds_many :messages

  ##Fields
   field :title, type: String
   field :users, type: Array, default: []
end
