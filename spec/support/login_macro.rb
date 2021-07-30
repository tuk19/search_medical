module LoginMacro
  def login_user(user)
    visit new_user_session_path
    fill_in 'user_login_email', with: user.email
    fill_in 'user_login_password', with: user.password
    click_on 'ログイン'
  end

  def login_staff(staff)
    visit new_medicalstaff_session_path
    fill_in 'medicalstaff_login_email', with: staff.email
    fill_in 'medicalstaff_login_password', with: staff.password
    click_on 'ログイン'
  end
end
