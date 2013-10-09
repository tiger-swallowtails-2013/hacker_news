require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "renders posts#index" do
       get 'index'
      response.should render_template :index
    end
  end
  describe "GET new" do
    context "create a comment" do
      it "renders _comment" do
        get :new, {:yield => "comment"}
        response.should render_template :new
      end
    end
    context "create a post" do
      it "renders _post" do
        get :new, {:yield => "post"}
        response.should render_template :new
      end
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