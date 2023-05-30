# spec/requests/works_spec.rb
require 'rails_helper'

RSpec.describe "Works", type: :request do
  let!(:user) { create(:user) }
  let!(:car) { create(:car, user: user) }

  describe "GET /works/new" do
    it "assigns user cars and initializes a new work" do
      sign_in user

      get new_work_path

      expect(assigns(:user_cars)).to eq(user.cars)
      expect(assigns(:work)).to be_a_new(Work)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /works" do
    let(:valid_params) { { work: { car_id: car.id, service_work: "oil change", next_appointment: 1.year.from_now, service_name: "Service 1" } } }

    it "creates a new work and updates the car log" do
      sign_in user

      expect {
        post works_path, params: valid_params
      }.to change(Work, :count).by(1)

      expect(assigns(:work)).to be_persisted
      expect(assigns(:work).car_id).to eq(car.id)
      expect(assigns(:work).service_work).to eq("oil change")

      log = car.log.reload
      expect(log.oil_change).to eq(1.year.from_now)

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(assigns(:work))
    end

    it "creates a new work without updating the car log if the log field is not present" do
      sign_in user

      invalid_params = { work: { car_id: car.id, service_work: "invalid_field", next_appointment: 1.year.from_now, service_name: "Service 1" } }

      expect {
        post works_path, params: invalid_params
      }.to change(Work, :count).by(1)

      expect(assigns(:work)).to be_persisted
      expect(assigns(:work).car_id).to eq(car.id)
      expect(assigns(:work).service_work).to eq("invalid_field")

      log = car.log.reload
      expect(log).to be_nil

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(assigns(:work))
    end
  end

  # More test cases for other request endpoints...

  private

  # Define any necessary helper methods for your request tests

end
