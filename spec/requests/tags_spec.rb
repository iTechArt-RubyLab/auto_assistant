# spec/controllers/tags_controller_spec.rb
require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe "POST create" do
    it "creates a new tag with permitted parameters" do
      tag_params = { name: "Test Tag" }

      expect {
        post :create, params: { tag: tag_params }
      }.to change(Tag, :count).by(1)

      expect(response).to redirect_to(tag_path(assigns(:tag)))
    end
  end
  private
end
