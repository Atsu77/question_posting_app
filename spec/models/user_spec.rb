require 'rails_helper'

RSpec.describe User, type: :model do
  it 'メールアドレス,パスワードがあれば有効な状態であること' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
  it '重複したメールアドレスは無効な状態であること' do
    FactoryBot.create(:user, email: 'test@gmail.com')
    user = FactoryBot.build(:user, email: 'test@gmail.com')
    expect(user).to be_invalid
  end

  it '名前が15文字以上であれば無効な状態であること' do
    user = FactoryBot.build(:user, name: 'a'*16)
    expect(user).to be_invalid
  end
  it 'パスワードが6文字以下であれば無効な状態であること' do
    user = FactoryBot.build(:user, password: '12345')
    expect(user).to be_invalid
  end
  it 'メールアドレスが規定の形式で入力されていなければ無効な状態であること' do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    addresses.each do |address|
      user = FactoryBot.build(:user, email: address)
      expect(user).to be_invalid
    end
  end
end
