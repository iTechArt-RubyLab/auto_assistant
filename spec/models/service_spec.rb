# spec/models/service_spec.rb
require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "associations" do
    it { should have_many(:taggables).dependent(:destroy) }
    it { should have_many(:tags).through(:taggables) }
    it { should have_many(:comments) }
    it { should have_one(:user) }
  end
end
