require 'rails_helper'

RSpec.describe CarsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/cars/new").to route_to("cars#new")
    end

    it "routes to #edit" do
      expect(get: "/cars/1/edit").to route_to("cars#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/cars").to route_to("cars#create")
    end

    it "routes to #update" do
      expect(patch: "/cars/1").to route_to("cars#update", id: "1")
    end
  end
end
