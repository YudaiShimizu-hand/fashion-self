require 'rails_helper'

RSpec.describe "Topics", type: :model do
    describe 'topicを登録できる' do
        it '新規登録できる' do
            topic = build(:topic)
            expect(topic).to be_valid
        end
    end
    describe 'バリデーション' do
        it 'titleがない場合無効' do
         topic = build(:topic, title: " ")
         expect(topic.valid?).to eq false
        end
    end
end