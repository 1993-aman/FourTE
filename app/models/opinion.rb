class Opinion
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short
#Associations
	# belongs_to :user
	embedded_in :doubt

##Fields
 field :title, type: String
end
