Fabricator(:product) do
  name "MyString"
  text "MyText"
  price_now "9.99"
  price_old "9.99"
  img File.open('app/assets/images/rails.png')
  is_hidden false
  is_special false
end
