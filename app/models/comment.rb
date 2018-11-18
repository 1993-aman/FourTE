class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  ## fields
  field :text, :type => String
  field :commented_at, :type => Time
  
  ## associations
  belongs_to :user
  embedded_in :post, :inverse_of => :comments
  
  ##validations

  ## callbacks



private

end
