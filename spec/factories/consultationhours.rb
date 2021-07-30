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

  factory :editconsultationhour, class: "Consultationhour" do
    start_time { "2021-07-29 8:30:00" }
    end_time { "2021-07-29 13:00:00" }
    monday { "●" }
    tuesday { "●" }
    wednesday { "※" }
    thursday { "-" }
    friday { "●" }
    saturday { "●" }
    sunday { "※" }
    holiday { "-" }
    detail { "※は12:30まで" }
    institution_id { "1" }
  end
end
