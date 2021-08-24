FactoryBot.define do
    factory :user do
      username { 'TEST' }
      sequence(:email) { |n| "person#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
      profile { 'prof' }
    end
  end