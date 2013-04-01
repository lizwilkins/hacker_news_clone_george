require 'spec_helper'

describe StoriesController do 
  context 'routing' do
    it {should route(:get, '/stories/new').to :action => :new}
    it {should route(:post, '/stories').to :action => :create}
    it {should route(:get, '/stories/1').to :action => :show, :id => 1}
    it {should route(:get, '/stories/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/stories/1').to :action => :update, :id => 1}
    it {should route(:delete, '/stories/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/stories').to :action => :index}
  end

  context 'POST create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{:title => 'a great story', :url => 'http://www.google.com'}}
      let(:valid_parameters) {{:story => valid_attributes}}

      it 'creates a new story' do
        expect {post :create, valid_parameters}.to change(Story, :count).by(1)
      end

      before {post :create, valid_parameters}
      it {should redirect_to new_story_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:title => ''}}
      let(:invalid_parameters) {{:story => invalid_attributes}}
      before {post :create, invalid_parameters}

      it {should render_template :new}
    end    
  end

  context 'GET new' do
    before {get :new}

    it {should render_template :new}
  end

  context 'GET index' do
    before {get :index}

    it {should render_template :index}
  end  

  context 'PUT update' do
    let(:story) {Story.create({:title => 'Old title', :url => 'http://reallylame.com'})}

    let(:valid_attributes) {{:title => 'Better title', :url => 'http://muchcooler.com'}}
    let(:valid_parameters) {{:id => story.id, :story => valid_attributes}}
    before {put :update, valid_parameters}

    it 'updates the contact' do
      Story.find(story.id).title.should eq valid_attributes[:title]
    end

    it {should respond_with 200}
  end
end