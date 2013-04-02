class Story < ActiveRecord::Base
  validates :title, :url, :presence => true
  attr_accessible :title, :url

  has_many :comments

  before_save :title_case

  private

  def title_case
    self.title = self.title.split(' ').map {|word| word.capitalize}.join(' ')
  end
end