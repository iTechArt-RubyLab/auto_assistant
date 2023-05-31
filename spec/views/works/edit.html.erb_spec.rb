require 'rails_helper'

RSpec.describe "works/edit", type: :view do
  let(:work) {
    Work.create!(
      car_id: 1,
      service_work: "MyString"
    )
  }

  before(:each) do
    assign(:work, work)
  end

  it "renders the edit work form" do
    render

    assert_select "form[action=?][method=?]", work_path(work), "post" do

      assert_select "input[name=?]", "work[car_id]"

      assert_select "input[name=?]", "work[service_work]"
    end
  end
end
