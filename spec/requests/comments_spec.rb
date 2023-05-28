# spec/requests/comments_spec.rb
require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:service) { create(:service) }
  let!(:comment) { create(:comment, service: service) }

  describe "POST /services/:service_id/comments" do
    it "creates a new comment for the service" do
      comment_params = { comment: { user_name: "John", body: "Great service!" } }

      expect {
        post "/services/#{service.id}/comments", params: comment_params
      }.to change(Comment, :count).by(1)

      expect(response).to redirect_to(service_path(service))
      expect(flash[:notice]).to eq("Comment was successfully created.")
    end

    it "renders the 'new' template for invalid comment" do
      comment_params = { comment: { user_name: "", body: "" } }

      expect {
        post "/services/#{service.id}/comments", params: comment_params
      }.not_to change(Comment, :count)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE /services/:service_id/comments/:id" do
    it "destroys the comment" do
      expect {
        delete "/services/#{service.id}/comments/#{comment.id}"
      }.to change(Comment, :count).by(-1)

      expect(response).to redirect_to(service_path(service))
      expect(flash[:notice]).to eq("Comment was successfully destroyed.")
    end
  end

  # More test cases for other controller actions...

end
