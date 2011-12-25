require 'spec_helper'

describe "carts/show.html.erb" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart,
      :cart_products_count => 1,
      :amount => 1,
      :price_old => "9.99",
      :price_now => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
