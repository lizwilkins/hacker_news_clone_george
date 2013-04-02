require 'spec_helper'

describe Comment do 
  context 'validations' do 
    it {should validate_presence_of :text}
    it {should validate_presence_of :story_id}
    it {should allow_mass_assignment_of :text}
    it {should allow_mass_assignment_of :story_id}

  end
end
