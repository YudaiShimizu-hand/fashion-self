require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー登録できる' do
   it '新規登録できる' do
    user = build(:user)
    expect(user).to be_valid
   end
  describe 'ユーザー名検証' do
   it 'ユーザー名が空だとNG' do
    user = build(:user, username: nil)
    expect(user.valid?).to eq false
   end
  end
  describe 'メールアドレスを検証' do
    it 'メールアドレスがないと無効' do
    user = build(:user, email: nil)
    expect(user.valid?).to eq false
   end
   it '重複したメールアドレスは無効' do
      user = create(:user)
      another_user = build(:user, email: "yamadacom")
      another_user.valid?
      expect(another_user.valid?).to eq false
   end
  end
  describe 'パスワードの検証' do
   it 'パスワードがない場合無効' do
    user = build(:user, password: " ", password_confirmation: " ")
    expect(user.valid?).to eq false
   end
   it 'パスワードは5文字以下だと無効' do
    user = build(:user, password: "12345", password_confirmation: "12345")
    expect(user.valid?).to eq false
   end
   it 'パスワードが6文字以上なら有効' do
    user = build(:user, password: "123456", password_confirmation: "123456")
    user.valid?
    expect(user).to be_valid
   end
   it "パスワード再入力が空である場合は登録できないこと" do
    user = build(:user, password_confirmation: "")
    expect(user.valid?).to eq false
   end
   it "パスワード再入力が入力されていても、パスワードと一致しない場合は登録できないこと" do
    user = build(:user, password: "000000", password_confirmation: "111111")
    expect(user.valid?).to eq false
   end
  end
  describe '自己紹介を検証' do
   it '50文字以上は無効' do
    user = build(:user, profile: 'a' * 51)
    expect(user.valid?).to eq false
   end
  end
  describe "FollowとUnFollow" do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user) }
    before {user.follow(other_user)}

    describe "follow" do
      it '成功' do
        expect(user.following?(other_user)).to be_truthy
      end
    end
    describe "followers" do
      it "succeeds" do
        expect(other_user.followers.include?(user)).to be_truthy
      end
    end
    describe "unfollow" do
      it "成功" do
        user.unfollow(other_user)
        expect(user.following?(other_user)).to be_falsy
      end
    end
    describe "unfollow" do
      it "succeeds" do
        user.unfollow(other_user)
        expect(user.following?(other_user)).to be_falsy
      end
    end
  end
 end
end