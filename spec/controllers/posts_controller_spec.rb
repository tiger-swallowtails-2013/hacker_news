require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "renders posts#index" do
       get 'index'
      response.should render_template :index
    end
  end
  describe "GET new" do
    it "renders posts#new" do
      get 'new'
      response.should render_template :new
    end
  end
  describe "POST create" do
    let(:valid_attributes) { {:post => FactoryGirl.attributes_for(:post)} }
    context "with valid params" do
      it "redirects to new posts#show" do
        post :create, valid_attributes
        response.should redirect_to post_path Post.last
      end
    end
    context "with invalid params" do
      it "re-renders posts#new" do
        valid_attributes[:post][:title] = nil
        invalid_attributes = valid_attributes
        post 'create', invalid_attributes
        response.should render_template 'new'
      end
    end
  end
end