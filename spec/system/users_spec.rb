require 'rails_helper'

RSpec.describe 'Users', type: :system do
    let(:user) { create(:user) }
    describe 'ログイン前' do
     describe 'トップページにアクセス' do
        it 'root_pathへアクセス' do
            visit root_path
        end
      end
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功する' do
            visit new_user_registration_path
            fill_in 'user[username]', with: 'test'
            fill_in 'user[email]', with: 'user_1@example.com'
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq fashions_path
          end
        end
        context 'メールアドレスが未入力' do
          it 'ユーザーの新規作成が失敗する' do
            visit new_user_registration_path
            fill_in 'user[username]', with: 'test'
            fill_in 'user[email]', with: ''
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'Sign up'
            expect(page).to have_content "Email can't be blank"
          end
        end
        context '登録済のメールアドレスを使用' do
          it 'ユーザーの新規作成が失敗する' do
            visit new_user_registration_path
            fill_in 'user[username]', with: user.username
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'Sign up'
            expect(page).to have_content 'Email has already been taken'
          end
        end
      end
    end
   end