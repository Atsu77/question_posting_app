FactoryBot.define do
  factory :answer do
    content { 'こうすれば出来ますよ' }
    association  :user 
    association  :question 
  end
end
