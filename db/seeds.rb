require 'json'

file = File.read('productdata.json')
data = JSON.parse(file)

puts data
