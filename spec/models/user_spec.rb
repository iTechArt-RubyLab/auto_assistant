# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:cars) }
    it { should belong_to(:service).optional }
  end
end

