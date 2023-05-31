require 'rails_helper'

RSpec.describe "works/new", type: :view do
  before(:each) do
    assign(:work, Work.new(
      car_id: 1,
      service_work: "MyString"
    ))
  end

  it "renders new work form" do
    render

    assert_select "form[action=?][method=?]", works_path, "post" do

      assert_select "input[name=?]", "work[car_id]"

      assert_select "input[name=?]", "work[service_work]"
    end
  end
end
