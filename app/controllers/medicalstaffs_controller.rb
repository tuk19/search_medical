class MedicalstaffsController < ApplicationController
  before_action :authenticate_medicalstaff!

  def index
    @staff = Medicalstaff.find(current_medicalstaff.id)
    staff_institutions = @staff.staff_institutions.pluck(:institution_id)
    @staff_institution_list = Institution.includes(:staff_institutions).find(staff_institutions)
  end

  def edit
    @staff = Medicalstaff.find(current_medicalstaff.id)
  end

  def update
    @staff = Medicalstaff.find(current_medicalstaff.id)
    if @staff.update(medicalstaff_params)
      flash[:notice] = "プロフィール情報を更新しました"
      redirect_to edit_medicalstaff_path(current_medicalstaff)
    else
      render "edit"
    end
  end

  private
  def medicalstaff_params
    params.require(:medicalstaff).permit(:name, :address)
  end
end
