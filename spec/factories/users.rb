FactoryBot.define do
  factory :user do
    name {'John'}
    sequence(:email) {|n| "test#{n}@example.com"}
    password {"foobar"}
  end
end
