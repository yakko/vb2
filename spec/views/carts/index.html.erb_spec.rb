require 'spec_helper'

describe "carts/index.html.erb" do
  before(:each) do
    assign(:carts, [
      stub_model(Cart,
        :cart_products_count => 1,
        :amount => 1,
        :price_old => "9.99",
        :price_now => "9.99"
      ),
      stub_model(Cart,
        :cart_products_count => 1,
        :amount => 1,
        :price_old => "9.99",
        :price_now => "9.99"
      )
    ])
  end

  it "renders a list of carts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
