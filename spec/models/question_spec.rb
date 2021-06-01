require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'コンテンツとタイトル' do
    it 'titleとcontentがあれば有効であること' do
      question = FactoryBot.create(:question)
      expect(question).to be_valid
    end
    it 'titleがあればcontentがなくても有効であること' do
      question = FactoryBot.create(:question, content: nil)
      expect(question).to be_valid
    end
    it 'titleがなければ無効であること' do
      question = FactoryBot.build(:question, title: nil)
      expect(question).to be_invalid
    end
  end
  describe 'contentの長さ' do
    it 'contentのサイズが140以下であれば有効であること' do
      question = FactoryBot.create(:question, content: 'a' * 139)
      expect(question).to be_valid
    end
    it 'contentのサイズが140以上であれば無効であること' do
      question = FactoryBot.build(:question, content: 'a' * 141)
      expect(question).to be_invalid
    end
  end
end
