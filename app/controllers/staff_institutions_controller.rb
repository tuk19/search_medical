class StaffInstitutionsController < ApplicationController
  def create
    @institution = Institution.find(params[:institution_id])
    @staff_institution  = StaffInstitution.create(medicalstaff_id: current_medicalstaff.id, institution_id: @institution.id)

  end

  def destroy
    @institution = Institution.find(params[:institution_id])
    @staff_institution = StaffInstitution.find_by(medicalstaff_id: current_medicalstaff.id, institution_id: @institution.id)
    @staff_institution.destroy
  end
end
