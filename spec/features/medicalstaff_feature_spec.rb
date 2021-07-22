require 'rails_helper'

RSpec.feature 'Medicalstaff_Features', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe "medicalstaff_login" do
    let(:medicalstaff) { create(:teststaff) }

    scenario "新規作成できるか" do
      visit new_medicalstaff_registration_path
      expect(page).to have_content("新規登録")
      fill_in "medicalstaff_registration_email", with: "example@example.com"
      fill_in "medicalstaff_registration_password", with: "foobar"
      fill_in "medicalstaff_registration_confirm_password", with: "foobar"
      expect do
        click_button "新規登録"
      end.to change(Medicalstaff, :count).by(1)
    end

    scenario 'ログインできるか' do
      visit medicalstaff_session_path
      expect(page).to have_content("医療関係者ログイン")
      fill_in "medicalstaff_login_email", with: medicalstaff.email
      fill_in "medicalstaff_login_password", with: medicalstaff.password
      click_button "ログイン"
      expect(page).to have_content("ログインしています")
    end
  end

  describe "link_to_medicalstaffs" do
    let(:medicalstaff) { create(:teststaff, :staff_institution) }

    background do
      sign_in medicalstaff
    end

    scenario '登録情報画面からアカウント情報編集画面へ遷移し、登録情報画面へ戻れるか' do
      visit medicalstaffs_path
      expect(page).to have_content(medicalstaff.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("登録情報を編集する")
      click_link "アカウント情報を編集する"
      expect(page).to have_content("アカウント情報変更")
      click_link "戻る"
      expect(page).to have_content(medicalstaff.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("登録情報を編集する")
    end

    scenario 'プロフィール画面からアカウント情報編集画面へ遷移し、プロフィール画面へ戻れるか', js: true do
      visit medicalstaffs_path
      expect(page).to have_content("登録解除")
      expect(page).not_to have_content("所属登録")
      find('.like-btn').click
      expect(page).not_to have_content("登録解除")
      expect(page).to have_content("所属登録")
    end

    scenario 'アカウント編集画面からアカウント情報が更新できるか' do
      visit edit_medicalstaff_registration_path
      expect(page).to have_content("アカウント情報変更")
      fill_in 'edit_user_registratin_email', with: "edituser@user.com"
      fill_in 'edit_user_registratin_password', with: "foobarbaz"
      fill_in 'edit_user_registratin_confirm_password', with: "foobarbaz"
      fill_in 'edit_user_current_password', with: medicalstaff.password
      click_button "アカウント情報を更新する"
      expect(page).to have_content("アカウント情報を変更しました")
    end

    scenario '登録情報画面から登録情報編集画面へ遷移できるか' do
      visit medicalstaffs_path
      expect(page).to have_content(medicalstaff.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("登録情報を編集する")
      click_link "登録情報を編集する"
      expect(page).to have_content("登録情報編集")
    end

    scenario '医療機関情報一覧へ遷移できるか' do
      visit medicalstaffs_path
      expect(page).to have_content(medicalstaff.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("登録情報を編集する")
      click_link "医療機関情報"
      expect(page).to have_content("医療機関検索フォーム")
    end

    scenario '登録情報編集画面からログアウトできるか' do
      visit medicalstaffs_path
      expect(page).to have_content(medicalstaff.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("登録情報を編集する")
      click_link "ログアウト"
      expect(page).to have_content("ログインしてお気に入り機能を使おう")
    end

    scenario '登録情報画面から登録情報画面へ遷移できるか' do
      visit edit_medicalstaff_path(medicalstaff.id)
      expect(page).to have_content("登録情報編集")
      click_link "登録情報確認"
      expect(page).to have_content(medicalstaff.email)
      expect(page).to have_content("アカウント情報を編集する")
      expect(page).to have_content("登録情報を編集する")
    end

    scenario '登録情報編集画面から登録情報情報が更新できるか' do
      visit edit_medicalstaff_path(medicalstaff.id)
      expect(page).to have_content("登録情報編集")
      fill_in 'medicalstaff_edit_name', with: "new_medicalstaff_name"
      click_button "更新する"
      expect(page).to have_content("プロフィール情報を更新しました")
      expect(page).to have_content("new_medicalstaff_name")
    end
  end
end
