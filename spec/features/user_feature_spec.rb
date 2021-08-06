require 'rails_helper'

RSpec.feature 'Users_Features', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe "user_login" do
    let(:user) { create(:testuser) }

    scenario 'user_infoへアクセスできるか' do
      visit root_path
      expect(page).to have_content('ログインしてお気に入り機能を使おう')
      click_link "詳しい使い方"
      expect(page).to have_content('お気に入りに登録すると、プロフィール画面にお気に入り一覧が表示されます。')
    end

    scenario '新規登録画面へアクセスできるか' do
      visit root_path
      expect(page).to have_content('ログインしてお気に入り機能を使おう')
      within(".user_login") do
        click_link "新規登録"
      end
      expect(page).to have_content("患者様・ご家族様新規登録")
    end

    scenario 'ログイン画面へアクセスできるか' do
      visit root_path
      expect(page).to have_content('ログインしてお気に入り機能を使おう')
      within(".user_login") do
        click_link "ログイン"
      end
      expect(page).to have_content("患者様・ご家族様ログイン")
    end

    scenario 'user_infoから新規登録画面へアクセスできるか' do
      visit top_user_info_path
      expect(page).to have_content('お気に入りに登録すると、プロフィール画面にお気に入り一覧が表示されます。')
      click_link "新規登録"
      expect(page).to have_content("患者様・ご家族様新規登録")
    end

    scenario 'user_infoからログイン画面へアクセスできるか' do
      visit top_user_info_path
      expect(page).to have_content('お気に入りに登録すると、プロフィール画面にお気に入り一覧が表示されます。')
      click_link "ログイン"
      expect(page).to have_content("患者様・ご家族様ログイン")
    end

    scenario "新規作成できるか" do
      visit new_user_registration_path
      expect(page).to have_content("患者様・ご家族様新規登録")
      fill_in "user_registration_email", with: "example@example.com"
      fill_in "user_registration_password", with: "foobar"
      fill_in "user_registration_confirm_password", with: "foobar"
      expect do
        click_button "新規登録"
      end.to change(User, :count).by(1)
    end

    scenario 'ログインできるか' do
      visit user_session_path
      expect(page).to have_content("患者様・ご家族様ログイン")
      fill_in "user_login_email", with: user.email
      fill_in "user_login_password", with: user.password
      click_button "ログイン"
      expect(page).to have_content("ログインしています")
    end
  end

  describe "user_signed_in" do
    let(:user) { create(:testuser) }
    let(:institution) { create(:tokyoinstitution) }
    let!(:favorite) { create(:testfavorite, user: user, institution: institution) }

    background do
      sign_in user
    end

    scenario 'user_infoへアクセスできるか' do
      visit root_path
      click_link "詳しい使い方"
      expect(page).to have_content('お気に入りに登録すると、プロフィール画面にお気に入り一覧が表示されます。')
    end

    scenario 'ログインしている時、使用法説明ページに新規登録、ログインが表示されない' do
      visit top_user_info_path
      expect(page).to have_content('お気に入りに登録すると、プロフィール画面にお気に入り一覧が表示されます。')
      expect(page).not_to have_content("新規登録")
      expect(page).not_to have_content("ログイン")
    end

    scenario 'プロフィール画面からアカウント情報編集画面へ遷移し、プロフィール画面へ戻れるか' do
      visit users_path
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
      click_link "アカウント情報を編集する"
      expect(page).to have_content("アカウント情報変更")
      click_link "戻る"
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
    end

    scenario 'お気に入りを解除できるか', js: true do
      visit users_path
      expect(page).to have_content("お気に入り解除")
      find('.like-btn').click
      expect(page).not_to have_content("お気に入り解除")
    end

    scenario 'アカウント編集画面からアカウント情報が更新できるか' do
      visit edit_user_registration_path
      expect(page).to have_content("アカウント情報変更")
      fill_in 'edit_user_registratin_email', with: "edituser@user.com"
      fill_in 'edit_user_registratin_password', with: "foobarbaz"
      fill_in 'edit_user_registratin_confirm_password', with: "foobarbaz"
      fill_in 'edit_user_current_password', with: user.password
      click_button "アカウント情報を更新する"
      expect(page).to have_content("アカウント情報を変更しました")
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

    scenario 'プロフィール編集画面からログアウトできるか' do
      visit users_path
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("プロフィールを編集する")
      within(".logout_users") do
        click_link "ログアウト"
      end
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
