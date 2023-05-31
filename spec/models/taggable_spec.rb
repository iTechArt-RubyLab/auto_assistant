# spec/models/taggable_spec.rb
require 'rails_helper'

RSpec.describe Taggable, type: :model do
  describe "associations" do
    it { should belong_to(:tag) }
    it { should belong_to(:service) }
  end
end
