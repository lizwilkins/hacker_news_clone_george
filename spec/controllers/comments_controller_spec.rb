require 'spec_helper'

describe CommentsController do 
  let(:comment) {Comment.create({:text => 'This link really sucked. I want my money back.', :story_id => 2})}

  context 'routing' do
    it {should route(:get, '/comments/new').to :action => :new}
    it {should route(:post, '/comments').to :action => :create}
    it {should route(:get, '/comments/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/comments/1').to :action => :update, :id => 1}
    it {should route(:delete, '/comments/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/comments').to :action => :index}
  end

  context 'POST create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{:text => 'a great comment', :story_id => 1}}
      let(:valid_parameters) {{:comment => valid_attributes}}

      it 'creates a new comment' do
        expect {post :create, valid_parameters}.to change(Comment, :count).by(1)
      end

      before {post :create, valid_parameters}
      it {should redirect_to new_comment_path}
      it {should set_the_flash[:notice]}
      it {should respond_with 302}

    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:text => ''}}
      let(:invalid_parameters) {{:comment => invalid_attributes}}
      before {post :create, invalid_parameters}

      it {should render_template :new}

    end    
  end

  context 'GET edit' do
    before {get :edit, :id => comment.id}
    it {should render_template :edit}
  end

  context 'GET new' do
    before {get :new}

    it {should render_template :new}
  end

  context 'GET index' do
    before {get :index}

    it {should render_template :index}
  end  

  context 'DELETE destroy' do
    it 'destroys a comment' do
      comment_to_destroy = comment
      expect {delete :destroy, {:id => comment_to_destroy.id}}.to change(Comment, :count).by(-1)
    end
  end

  context 'PUT update' do
    let(:valid_attributes) {{:text => 'Better comment', :story_id => 2}}
    let(:valid_parameters) {{:id => comment.id, :comment => valid_attributes}}
    before {put :update, valid_parameters}

    it 'updates the contact' do
      Comment.find(comment.id).text.should eq valid_attributes[:text]
    end


    it {should respond_with 302}
  end  

end