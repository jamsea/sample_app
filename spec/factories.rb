Factory.define :user do |user|
  user.name                  "Test User"
  user.email                 "test@email.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end
