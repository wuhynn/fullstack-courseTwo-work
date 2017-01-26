# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

Profile.create! [
  { gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina"},
  { gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump"},
  { gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson"},
  { gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton"}
]

#TodoList per user due one year from now
fast_forward_one_year = Date.today + 365

Profile.all.each do |profile|
    profile.create_user(username: profile.last_name, password_digest: profile.first_name)
    profile.user.todo_lists.create!(list_name: profile.first_name, list_due_date: fast_forward_one_year)
end

TodoList.all.each do |theList|
  5.times do
    theList.todo_items.create!(title: "Important Task", description: "Don't become president.", due_date: fast_forward_one_year)

  end
end
