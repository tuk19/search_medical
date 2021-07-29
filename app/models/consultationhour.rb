class Consultationhour < ApplicationRecord
  belongs_to :institution

  validates :start_time, presence: true, format: { with: /[[0-2]0-9]:[0-5][0-9]/, message: "開始時間は[00:00]の形式で入力してください" }
  validates :end_time, presence: true, format: { with: /\d{2}:\d{2}/ }
end
