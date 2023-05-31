# spec/models/tag_spec.rb
require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "associations" do
    it { should have_many(:taggables).dependent(:destroy) }
    it { should have_many(:services).through(:taggables) }
  end
end

