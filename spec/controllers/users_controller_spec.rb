require 'spec_helper'

describe UsersController do
  describe "Get #new" do
    it "shows a new user signup form" do
      get 'new'
      response.should render_template :new
    end
  end

  describe "Get #show" do
    let (:example_user) {FactoryGirl.create(:user)}
    it "assigns correct user to @user" do
      user = example_user
      get "show", id: user
      assigns(:user). should eq(user)
    end

    it "renders :show view correctly" do
      get "show", id: example_user
      response.should render_template :show
    end
  end

  describe "Post #create" do
    let (:valid_params) { {:user => FactoryGirl.attributes_for(:user)} }
    context "with valid attributes" do
      it "saves new user" do
        post :create, valid_params
        response.should redirect_to "users#show"
      end
    end
    context "with invalid attributes" do
      it "does not save a new user" do
        valid_params[:user][:email] = nil
        invalid_params = valid_params
        p invalid_params
        post :create, invalid_params
        response.should render_template "new"
      end
    end
  end
end
