User.destroy_all

5.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.safe_email(user.first_name)
  user.password = "12341234"
  user.password_confirmation = "12341234"
  user.phone_number = Faker::PhoneNumber.phone_number
  user.save
end

Todo.destroy_all

User.all.each do |user|
  10.times do
    todo = Todo.new
    todo.user = user
    todo.content = Faker::Hacker.say_something_smart
    todo.save
  end
end













