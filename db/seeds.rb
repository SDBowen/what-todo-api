# frozen_string_literal: true

user_one = User.create(
  email: 'userOne@test.com',
  password: 'password'
)

user_two = User.create(
  email: 'usertwo@test.com',
  password: 'password'
)

project_one = Project.create(
  title: 'Shopping List',
  user_id: user_one.id
)

project_two = Project.create(
  title: 'Car Maintenance',
  user_id: user_one.id
)

item_one = Item.create(
  description: 'Oil change',
  project_id: project_one.id
)

item_two = Item.create(
  description: 'New tires',
  project_id: project_one.id
)

puts Project.all.inspect
puts Item.all.inspect
