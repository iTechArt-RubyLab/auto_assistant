# spec/models/car_spec.rb
require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "associations" do
    it { should have_one(:log) }
    it { should belong_to(:user) }
  end
end
