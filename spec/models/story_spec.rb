require 'spec_helper'

describe Story do 

let(:story) {Story.create({:title => 'OLD tiTle', :url => 'http://reallylame.com'})}

  context 'validations' do 
    it {should validate_presence_of :title}
    it {should validate_presence_of :url}
    it {should allow_mass_assignment_of :title}
    it {should allow_mass_assignment_of :url}
  end

  context 'associations' do
    it {should have_many(:comments)}
  end

  context 'callbacks' do

    it 'changes the title into title case' do
      story.title.should eq 'Old Title'
    end
  end  
end