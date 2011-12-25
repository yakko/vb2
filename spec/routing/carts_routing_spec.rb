require "spec_helper"

describe CartsController do
  describe "routing" do

    it "routes to #current" do
      get("/cart").should route_to("carts#current")
    end
    it "routes to #add" do
      post("/cart/add").should route_to("carts#add")
    end

    it "routes to #delete" do
      post("/cart/delete").should route_to("carts#delete")
    end
    
    
    
    

    it "routes to #index" do
      get("/carts").should route_to("carts#index")
    end

    it "routes to #show" do
      get("/carts/1").should route_to("carts#show", :id => "1")
    end

    it "routes to #update" do
      put("/carts/1").should route_to("carts#update", :id => "1")
    end

  end
end
