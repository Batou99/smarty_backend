FactoryGirl.define do
  factory :control do
    ui_control
    display_name { Faker::Lorem.characters(6) }
  end
end

