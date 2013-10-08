require 'spec_helper'

describe UsersController do
  context "Get #new" do
    it "shows a new user signup form" do
      get 'new'
      response.should render_template :new
    end  
  end
  context "Post #create" do
    it "saves a new user to the database"
    it "renders the show page"

end
