require 'rails_helper'

describe '投稿機能', type: :system  do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user, username: 'その他ユーザー') }
    let(:fashion) { FactoryBot.create(:fashion, user_id: user.id) }
 describe '投稿一覧ページアクセス' do
    it '#fashions_pathにアクセス' do
     sign_in user
     visit fashions_path
    end
 end
 describe '新規投稿' do
   it '投稿できること' do
    sign_in user
    visit new_fashion_path
    attach_file 'fashion[pic][]', "#{Rails.root}/spec/fixtures/test.png"
    fill_in 'fashion[title]', with: 'テスト'
    fill_in 'fashion[shop]', with: 'テスト'
    fill_in 'fashion[body]', with: 'テスト'
    click_button '投稿'
    expect(page).to have_current_path(fashions_path)
    expect(page).to have_content 'テスト'
    expect(page).to have_selector "img[src$='test.png']"
   end
 end
 describe '投稿一覧' do
  before do
    create(:fashion, user: user)
  end
   it '投稿がある' do
    sign_in user
    visit fashions_path
    expect(page).to have_content 'TEST'
   end
 end
 describe '自分の投稿を削除する' do
    before do
        create(:fashion, user: user)
    end
    it '投稿を削除' do
        sign_in user
        visit fashions_path
        find(".fa-lg").click
        expect(page).not_to have_content fashion
    end
 end
 describe '投稿詳細ページ' do
    before do
        create(:fashion, user: user)
    end
    it '詳細ページに表示される' do
        sign_in user
        visit fashion_path(fashion)
        expect(page).to have_content 'TEST'
    end
 end
end