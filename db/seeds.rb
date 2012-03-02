# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Shop.create(name: "Main")

Brand.create(name: "Brand1")

Product.create(name: "Product1", price: "23.2", wholesale: "30", brand_id: "1", reference: "600" )

Product.create(name: "AProduct1", price: "23.2", wholesale: "30", brand_id: "1" )

Product.create(name: "CProduct1", price: "23.2", wholesale: "30", brand_id: "1" )

Product.create(name: "BProduct1", price: "23.2", wholesale: "30", brand_id: "1" )