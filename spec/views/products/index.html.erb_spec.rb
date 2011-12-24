require 'spec_helper'

describe "products/index.html.erb" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :text => "MyText",
        :price_now => "9.99",
        :price_old => "9.99",
        :product_images_count => 1,
        :is_hidden => false,
        :is_special => false
      ),
      stub_model(Product,
        :name => "Name",
        :text => "MyText",
        :price_now => "9.99",
        :price_old => "9.99",
        :product_images_count => 1,
        :is_hidden => false,
        :is_special => false
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
