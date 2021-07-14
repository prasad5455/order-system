# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..10).to_a.each do |num|
  User.create(email: "admin_#{num}@example.com",admin_role: true, password: 'test_password')
  User.create(email: "user_#{num}@example.com", admin_role: false, password: 'test_password')
  Store.create(name: "Store #{num}", address: "Street #{num}, Area #{num}, City #{num}", contact: 9988776655)
  Category.create(id: num, name: "Category #{num}", description: "Test Desciption about category #{num}") if num < 4
  Item.create(name: "Item #{num}", description: "Test Desciption about Item #{num}", price: 250, store_id: num, category_id: (1..3).to_a.sample)
end
