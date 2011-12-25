require 'spec_helper'

describe "carts/new.html.erb" do
  before(:each) do
    assign(:cart, stub_model(Cart,
      :cart_products_count => 1,
      :amount => 1,
      :price_old => "9.99",
      :price_now => "9.99"
    ).as_new_record)
  end

  it "renders new cart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carts_path, :method => "post" do
      assert_select "input#cart_cart_products_count", :name => "cart[cart_products_count]"
      assert_select "input#cart_amount", :name => "cart[amount]"
      assert_select "input#cart_price_old", :name => "cart[price_old]"
      assert_select "input#cart_price_now", :name => "cart[price_now]"
    end
  end
end
