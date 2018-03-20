require 'json'

file = File.read('/vagrant/productdata.json')
data = JSON.parse(file)

products = data['products']

products.each do |product|
  categoryid = 0
  if product['category'] == 'basketball'
    categoryid = 1
  elsif product['category'] == 'hockey'
    categoryid = 2
  elsif product['category'] == 'football'
    categoryid = 3
  elsif product['category'] == 'baseball'
    categoryid = 4
  elsif product['category'] == 'mixed martial arts'
    categoryid = 5
  else
    categoryid = 6
  end

  new_product = Product.create(image: product['image'],
                 name: product['name'],
                 description: product['description'],
                 price: product['price'],
                 quantity: product['quantity'],
                 category_id: categoryid)
end
