class ConsultationhoursController < ApplicationController
  def index
    @consultationhour = Consultationhour.all
  end

  def create
    @consultationhour = Consultationhour.new(consultationhour_params)
    if @consultationhour.save
      redirect_to institution_path(@consultationhour.institution_id), notice: "診療時間を追加しました"
    else
      render template: "institutions/consultationhour"
    end
  end

  def edit
    @consultationhour = Consultationhour.find(params[:id])
  end

  def update
    @consultationhour = Consultationhour.find(params[:id])
    if @consultationhour.update(consultationhour_params)
      redirect_to institution_path(@consultationhour.institution_id), notice: "診療時間を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @consultationhour = Consultationhour.find(params[:id])
    @consultationhour.destroy
    redirect_to institutions_path, notice: "診療時間を削除しました"
  end
end

private

def consultationhour_params
  params.require(:consultationhour).permit(:start_time, :end_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :holiday, :detail, :institution_id)
end
