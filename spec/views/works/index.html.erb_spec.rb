require 'rails_helper'

RSpec.describe "works/index", type: :view do
  before(:each) do
    assign(:works, [
      Work.create!(
        car_id: 2,
        service_work: "Service Work"
      ),
      Work.create!(
        car_id: 2,
        service_work: "Service Work"
      )
    ])
  end

  it "renders a list of works" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Service Work".to_s), count: 2
  end
end
