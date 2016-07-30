FactoryGirl.define do
  factory :device_type do
    name { Faker::Lorem.characters(10) }
    controls { [create(:control)] }
  end
end

