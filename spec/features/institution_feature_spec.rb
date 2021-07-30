require 'rails_helper'

RSpec.feature "Institution_Features", type: :feature do
  let!(:institution) { create(:testinstitution) }

  feature "medicalstaffでログインしたとき" do
    let(:medicalstaff) { create(:teststaff) }

    before do
      login_staff(medicalstaff)
    end

    scenario "新規作成画面へ遷移できるか" do
      visit institutions_path
      expect(page).to have_content("医療機関検索フォーム")
      expect(page).to have_content(institution.name)
      click_link "新規作成"
      expect(page).to have_content("医療機関情報新規作成")
    end

    scenario "新規作成できるか" do
      visit new_institution_path
      fill_in  "institution_name_text", with: "exampleinstitution"
      fill_in "institution_postcode_text", with: "9876543"
      fill_in "institution_city_text", with: "大阪市大阪"
      fill_in "institution_street_text", with: "9-8-7"
      fill_in "institution_building_text", with: "アパート大阪201"
      fill_in "institution_intro_text", with: "内科・呼吸器"
      expect do
        click_button "登録する"
      end.to change(Institution, :count).by(1)
      expect(page).to have_content("医療機関を追加しました")
      expect(page).to have_content("exampleinstitution")
      expect(page).to have_content("大阪市大阪9-8-7アパート大阪201")
    end

    scenario "詳細ページへ遷移できるか", js: true do
      visit institutions_path
      find(".institution_index_tbody_tr").click
      expect(page).to have_content("医療機関情報")
      expect(page).to have_content("編　集")
      expect(page).to have_content("削　除")
    end

    scenario "詳細ページから編集画面が表示できるか" do
      visit institution_path(institution.id)
      expect(page).to have_content("医療機関情報")
      expect(page).to have_content("編　集")
      expect(page).to have_content("削　除")
      click_link "編　集"
      expect(page).to have_content("医療機関情報修正")
    end

    scenario "医療機関情報を編集できるか" do
      visit edit_institution_path(institution.id)
      expect(page).to have_content("医療機関情報修正")
      fill_in "institution_name_text", with: "testclinic"
      click_button "更新する"
      expect(page).to have_content("testclinic")
      expect(page).not_to have_content(institution.name)
    end
  end

  feature "userでログインしたとき" do
    let(:user) { create(:testuser) }

    before do
      login_user(user)
    end

    scenario "新規作成が表示されない" do
      visit institutions_path
      expect(page).to have_content("医療機関検索フォーム")
      expect(page).to have_content(institution.name)
      expect(page).not_to have_content("新規作成")
    end

    scenario "詳細ページから、編集、削除ができない", js: true do
      visit institutions_path
      find(".institution_index_tbody_tr").click
      expect(page).to have_content("医療機関情報")
      expect(page).not_to have_content("編　集")
      expect(page).not_to have_content("削　除")
    end
  end
end
