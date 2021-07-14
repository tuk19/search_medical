class InstitutionsController < ApplicationController
  before_action :set_q, only: :index

  def index
    max_num = 50
    if @q.result.count > 50
      @institution = @q.result.limit(max_num)
    else
      @institution = @q.result.all
    end
  end

  def new
    @institution = Institution.new
  end

  def create
    @institution = Institution.new(institution_params)
    @institution.address = @institution.join_address
    if @institution.save
      redirect_to institutions_path, notice: "医療機関を追加しました"
    else
      render "new"
    end
  end

  def edit
    @institution = Institution.find(params[:id])
  end

  def update
    @institution = Institution.find(params[:id])
    if @institution.update(institution_params)
      @institution.address = @institution.join_address
      if @institution.update(institution_params)
        redirect_to institutions_path, notice: "医療機関情報を更新しました"
      else
        render "edit"
      end
    else
      render "edit"
    end
  end

  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy
    redirect_to institutions_path, notice: "医療機関を削除しました"
  end

  private

  def institution_params
    params.require(:institution).permit(:name, :postcode, :prefecture, :address_city, :address_street, :address_building, :address, :introduction, :image)
  end

  def set_q
    @q = Institution.ransack(params[:q])
  end
end
