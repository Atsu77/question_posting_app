require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'contentがあれば有効であること' do
    answer = FactoryBot.create(:answer)
    expect(answer).to be_valid
  end
end
