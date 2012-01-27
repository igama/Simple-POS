# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Brand.delete_all
Product.delete_all 


Brand.create(
  :name => 'Apple',
  :logo_url => '/images/logos/apple.jpg'
)

Brand.create(
  :name => 'Blackberry',
  :logo_url => '/images/logos/blackberry.jpg'
)

Brand.create(
  :name => 'LG',
  :logo_url => '/images/logos/lg.jpg'
)

Product.create(
  :name => 'Phone 1',
  :image_url => '/images/products/1.jpg', 
  :price => 49.50,
  :brand_id => 1,
  :category => "Mobile"
  )
  
Product.create(
  :name => 'Phone 2',
  :image_url => '/images/products/2.jpg', 
  :price => 19.50,
  :brand_id => 1,
  :category => "Mobile"
  )
    
Product.create(
  :name => 'Phone 3',
  :image_url => '/images/products/3.jpg', 
  :price => 9.50,
  :brand_id => 1,
  :category => "Tablet"
  )