require 'spec_helper'

describe "carts/show.html.erb" do
  before(:each) do
    @cart = assign(:cart, Fabricate(:cart))
  end

  it "renders the edit cart form" do
    render
=begin
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carts_path(@cart), :method => "post" do
      assert_select "input#cart_cart_products_count", :name => "cart[cart_products_count]"
      assert_select "input#cart_amount", :name => "cart[amount]"
      assert_select "input#cart_price_old", :name => "cart[price_old]"
      assert_select "input#cart_price_now", :name => "cart[price_now]"
    end
=end
  end
end
