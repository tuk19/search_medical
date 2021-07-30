FactoryBot.define do
  factory :testconsultationhour, class: "Consultationhour" do
    start_time { "2021-07-29 8:30:00" }
    end_time { "2021-07-29 12:30:00" }
    monday { "●" }
    tuesday { "●" }
    wednesday { "●" }
    thursday { "-" }
    friday { "●" }
    saturday { "※" }
    sunday { "-" }
    holiday { "-" }
    detail { "土曜日は13:00まで" }
  end
end
