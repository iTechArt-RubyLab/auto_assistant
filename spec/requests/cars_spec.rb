# spec/controllers/cars_controller_spec.rb
require 'rails_helper'

RSpec.describe "Cars", type: :request do
  describe "GET new" do
    it "assigns a new car instance and sets the user id" do
      user = create(:user)
      sign_in user

      get :new

      expect(assigns(:car)).to be_a_new(Car)
      expect(assigns(:user_id)).to eq(user.id)
    end
  end


end
