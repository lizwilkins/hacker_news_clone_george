require 'spec_helper'

describe User do
  it {should allow_mass_assignment_of :email}
  it {should allow_mass_assignment_of :password_confirmation}
  it {should allow_mass_assignment_of :password_digest}

  it {should allow_mass_assignment_of :password}

  it {should validate_uniqueness_of :email}

end
