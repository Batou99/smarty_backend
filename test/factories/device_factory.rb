FactoryGirl.define do
  factory :device do
    name { Faker::Hipster.word }
    ip_address { Faker::Internet.ip_v4_address }
    device_type
  end
end

