require 'rails_helper'

RSpec.describe "tests/index", type: :view do
  before(:each) do
    assign(:tests, [
      Test.create!(
        :name => "Name"
      ),
      Test.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of tests" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
