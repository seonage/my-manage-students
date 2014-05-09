require "spec_helper"

describe MessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/students/1/messages/").should route_to("messages#index", :student_id => "1")
    end

    it "routes to #new" do
      get("/students/1/messages/new").should route_to("messages#new", :student_id => "1")
    end

    it "routes to #show" do
      get("/students/1/messages/1").should route_to("messages#show", :id => "1", :student_id => "1")
    end

    it "routes to #create" do
      post("/students/1/messages").should route_to("messages#create", :student_id => "1")
    end

    it "routes to #destroy" do
      delete("/students/1/messages/1").should route_to("messages#destroy", :id => "1", :student_id => "1")
    end

  end
end
