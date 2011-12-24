require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :text => "MyText",
      :price_now => "9.99",
      :price_old => "9.99",
      :product_images_count => 1,
      :is_hidden => false,
      :is_special => false
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_text", :name => "product[text]"
      assert_select "input#product_price_now", :name => "product[price_now]"
      assert_select "input#product_price_old", :name => "product[price_old]"
      assert_select "input#product_product_images_count", :name => "product[product_images_count]"
      assert_select "input#product_is_hidden", :name => "product[is_hidden]"
      assert_select "input#product_is_special", :name => "product[is_special]"
    end
  end
end
