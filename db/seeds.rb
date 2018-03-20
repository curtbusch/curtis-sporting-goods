require 'json'

file = File.read('productdata.json')
data = JSON.parse(file)

products = data['products']

products.each do |product|
  Product.create(name: product['name'],
                 )
end
