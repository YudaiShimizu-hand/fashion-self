require 'rails_helper'

RSpec.describe "Relationships", type: :model do
    let(:user) { create(:user)}
    let(:other_user) { create(:user) }
    let(:relationship) { user.following_relationships.build(following_id: other_user.id) }


 describe 'follow機能バリデーション' do
    it 'テスト有効' do
        expect(relationship).to be_valid
    end
 end
 describe 'presence' do
    it 'following_idがないと無効' do
        relationship.following_id = nil
        expect(relationship).to be_invalid
    end
    it 'follower_idがないと無効' do
        relationship.follower_id = nil
        expect(relationship).to be_invalid
    end
 end
end