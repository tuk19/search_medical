require 'rails_helper'

RSpec.feature "Consultationhour_Features", type: :feature do
  let(:medicalstaff) { create(:teststaff) }
  let(:institution) { create(:testinstitution) }

  before do
    login_staff(medicalstaff)
  end

  feature "登録内容が正しいとき" do
    before do
      visit institution_path(institution.id)
      click_link "診療時間を登録する"
    end

    scenario "新規作成できるか" do
      fill_in "new_start_time", with: "08:00"
      fill_in "new_end_time", with: "13:00"
      find('.monday_container').all('option')[1].select_option
      find('.tuesday_container').all('option')[1].select_option
      find('.wednesday_container').all('option')[0].select_option
      find('.thursday_container').all('option')[1].select_option
      find('.friday_container').all('option')[1].select_option
      find('.saturday_container').all('option')[1].select_option
      find('.sunday_container').all('option')[2].select_option
      find('.holiday_container').all('option')[1].select_option
      fill_in "new_detail", with: "日曜日は非常勤医師"
      expect do
        click_button "登録する"
      end.to change(Consultationhour, :count).by(1)
      expect(page).to have_content("診療時間を追加しました")
      expect(page).to have_content("日曜日は非常勤医師")
    end
  end

  feature "登録内容が正しくないとき" do
    before do
      visit institution_path(institution.id)
      click_link "診療時間を登録する"
    end

    scenario "未入力エラーメッセージが表示されるか" do
      click_button "登録する"
      expect(page).to have_content("開始時間が入力されていません")
      expect(page).to have_content("開始時間は[00:00]の形式で入力してください")
      expect(page).to have_content("終了時間が入力されていません")
      expect(page).to have_content("終了時間は[00:00]の形式で入力してください")
    end

    scenario "開始時間と終了時間のエラーメッセージが表示されるか" do
      fill_in "new_start_time", with: "13:00"
      fill_in "new_end_time", with: "10:00"
      click_button "登録する"
      expect(page).to have_content("終了時間は開始時間よりも後に設定してください")
    end
  end

  feature "診療時間が登録されていないとき" do
    scenario "登録されていないことが表示されるか" do
      visit institution_path(institution.id)
      expect(page).to have_content("診療時間が登録されていません")
    end
  end

  feature "診療時間が登録されているとき" do
    let!(:consultationhour) { create(:testconsultationhour, institution: institution) }

    scenario "診療時間新規登録ページへ遷移し、医療機関詳細ページに戻ることができるか" do
      visit institution_path(institution.id)
      expect(page).not_to have_content("診療時間が登録されていません")
      expect(page).to have_content("土曜日は13:00まで")
      click_link "診療時間を登録する"
      expect(page).to have_content("診療時間作成")
      click_link "医療機関情報へ戻る"
      expect(page).to have_content("土曜日は13:00まで")
    end

    scenario "診療時間編集ページへ遷移し、医療機関詳細ページに戻ることができるか" do
      visit institution_path(institution.id)
      expect(page).not_to have_content("診療時間が登録されていません")
      expect(page).to have_content("土曜日は13:00まで")
      click_link "修正"
      expect(page).to have_content("診療時間編集")
      click_link "医療機関情報へ戻る"
      expect(page).to have_content("土曜日は13:00まで")
    end

    scenario "診療時間を編集することができるか" do
      visit edit_consultationhour_path(consultationhour.id)
      expect(page).to have_content("診療時間編集")
      fill_in "edit_detail", with: "土曜日は14:00まで"
      click_button "更新する"
      expect(page).not_to have_content("土曜日は13:00まで")
      expect(page).to have_content("土曜日は14:00まで")
    end
  end
end
