FactoryBot.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end
end

FactoryBot.define do
  factory :user do
    first_name 'First Name'
    last_name 'Last Name'
    email
    password 'password'
    password_confirmation 'password'
    created_at Time.zone.now
    updated_at Time.zone.now
  end
end