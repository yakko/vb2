require 'spec_helper'

describe "carts/show.html.erb" do
  before(:each) do
    @cart = assign(:cart, Fabricate(:cart))
  end

  it "renders attributes in <p>" do
    render
=begin
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
=end
  end
end
