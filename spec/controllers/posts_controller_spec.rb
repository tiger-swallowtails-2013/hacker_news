require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "renders posts#index"
  end
  describe "GET new" do
    it "renders posts#new"
  end
  describe "POST create" do
    context "valid params" do
      it "redirects to new posts#show"
    end
    context "invalid params" do
      it "re-renders posts#create"
    end
  end

end