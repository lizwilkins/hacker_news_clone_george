require 'spec_helper'

describe Story do 
  context 'validations' do 
    it {should validate_presence_of :title}
    it {should validate_presence_of :url}
    it {should allow_mass_assignment_of :title}
    it {should allow_mass_assignment_of :url}
  end
end