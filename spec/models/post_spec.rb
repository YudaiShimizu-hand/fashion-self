require 'rails_helper'

RSpec.describe "Posts", type: :model do
    describe '掲示板投稿' do
        it '投稿が登録できる' do
            post = build(:post)
            expect(post).to be_valid
        end
    end
end