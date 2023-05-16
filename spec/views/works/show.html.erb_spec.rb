require 'rails_helper'

RSpec.describe "works/show", type: :view do
  before(:each) do
    assign(:work, Work.create!(
      car_id: 2,
      service_work: "Service Work"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Service Work/)
  end
end
