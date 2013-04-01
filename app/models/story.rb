class Story < ActiveRecord::Base
  validates :title, :url, :presence => true
  attr_accessible :title, :url
end