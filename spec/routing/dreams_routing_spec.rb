require "spec_helper"

describe DreamsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dreams").to route_to("dreams#index")
    end

    it "routes to #new" do
      expect(:get => "/dreams/new").to route_to("dreams#new")
    end

    it "routes to #show" do
      expect(:get => "/dreams/1").to route_to("dreams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dreams/1/edit").to route_to("dreams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dreams").to route_to("dreams#create")
    end

    it "routes to #update" do
      expect(:put => "/dreams/1").to route_to("dreams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dreams/1").to route_to("dreams#destroy", :id => "1")
    end

  end
end
