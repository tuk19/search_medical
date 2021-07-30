class Consultationhour < ApplicationRecord
  belongs_to :institution
  validates :start_time, presence: true, format: { with: /[[0-2]0-9]:[0-5][0-9]/, message: "は[00:00]の形式で入力してください" }
  validates :end_time, presence: true, format: { with: /[[0-2]0-9]:[0-5][0-9]/, message: "は[00:00]の形式で入力してください" }
  validate :before_start_time

  def before_start_time
    if start_time != nil && end_time != nil
      if end_time < start_time
        errors.add(:end_time, "は開始時間よりも後に設定してください")
      end
    end
  end
end
