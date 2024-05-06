# spec/factories/users.rb
require 'faker'
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }

    after(:create) do |user|
      user.roles << create(:role)
    end
    trait :admin do
      after(:create) { |user| user.roles << create(:role, name: 'admin') }
    end
  end
end
