FactoryBot.define do
  factory :question do
    title { 'ローカルでサーバーが起動できない' }
    content { 'rails s が出来ません' }
    solved { false }
    association :user
  end
end
