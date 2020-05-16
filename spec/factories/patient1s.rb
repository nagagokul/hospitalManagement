FactoryGirl.define do
  factory :patient1 do
    sequence(:patientid) { |n| "#{n}" }
    name        "test"
    age         23
    sex         "M"
    email       "test@email.com"
    cause       "fever"
    status      "admitted"
    doctor_id   2
    user_id     1
    doctor
    user
  end
end
