class Post
  include Mongoid::Document

  belongs_to :user
  embeds_many :comments

  field :title, type: String
  field :content, type: String
  field :created, :type => Date
  field :published_on, :type => Date
  
  accepts_nested_attributes_for :comments
  #
  # VALIDATIONS
  #
  validates_presence_of :content
end
