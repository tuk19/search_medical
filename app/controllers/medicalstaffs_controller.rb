class MedicalstaffsController < ApplicationController
  def index
    @staff = Medicalstaff.find(current_medicalstaff.id)
  end

  def edit
    @staff = Medicalstaff.find(current_medicalstaff.id)
  end

  def update
    @staff = medicalstaff.find(current_medicalstaff.id)
    if @staff.update(params.require(:medicalstaff).permit(:name, :address))
      flash[:notice] = "プロフィール情報を更新しました"
      redirect_to edit_medicalstaff_path(current_medicalstaff)
    else
      render "edit"
    end
  end
end
