FactoryBot.define do
    factory :like do
      association :fashion
      association :user
      user { fashion.user }
    end
  end
  