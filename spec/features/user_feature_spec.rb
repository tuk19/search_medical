require 'rails_helper'

RSpec.feature 'Users_Features', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe "link_to_users" do
    let(:user) { create(:testuser) }

    background do
      sign_in user
    end

    scenario 'プロフィール画面からプロフィール編集画面へ遷移できるか' do
      visit users_path
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
      click_link "プロフィールを編集する"
      expect(page).to have_content("ユーザープロフィール編集")
    end

    scenario '医療機関情報一覧へ遷移できるか' do
      visit users_path
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
      click_link "医療機関情報"
      expect(page).to have_content("医療機関検索フォーム")
    end

    scenario '医療機関情報一覧へ遷移できるか' do
      visit users_path
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
      click_link "医療機関情報"
      expect(page).to have_content("医療機関検索フォーム")
    end

    scenario 'プロフィール編集画面からログアウトできるか' do
      visit users_path
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
      click_link "ログアウト"
      expect(page).to have_content("ログインしてお気に入り機能を使おう")
    end

    scenario 'プロフィール編集画面からプロフィール画面へ遷移できるか' do
      visit edit_user_path(user.id)
      expect(page).to have_content("ユーザープロフィール編集")
      click_link "プロフィール画面"
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
    end

    scenario 'プロフィール編集画面からプロフィール情報が更新できるか' do
      visit edit_user_path(user.id)
      expect(page).to have_content("ユーザープロフィール編集")
      fill_in 'user_edit_name', with: "new_user_name"
      click_button "更新する"
      expect(page).to have_content("プロフィール情報を更新しました")
      expect(page).to have_content("new_user_name")
    end
  end
end
