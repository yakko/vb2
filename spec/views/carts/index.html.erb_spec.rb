require 'spec_helper'

describe "carts/index.html.erb" do
  before(:each) do
    assign(:carts, [
      Fabricate(:cart),
      Fabricate(:cart)
    ])
  end

  it "renders a list of carts" do
    render
=begin
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
=end
  end
end
