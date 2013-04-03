require 'spec_helper'

describe SessionsController do

  context 'GET new' do
    it "returns http success" do
      response.should be_success
    end
  end

  # context 'POST create' do
  #   it "returns http success" do
  #     response.should be_success
  #   end
  # end

  # context 'DELETE destroy' do
  #   it "returns http success" do
  #     response.should be_success
  #   end
  # end 

end
