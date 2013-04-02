class Comment < ActiveRecord::Base
  validates :text, :story_id, :presence => true
  attr_accessible :text, :story_id

 belongs_to :story

end
