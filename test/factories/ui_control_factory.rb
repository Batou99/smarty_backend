FactoryGirl.define do
  factory :ui_control do
    kind { 'slider' }
    values { (0..100).to_a }
    default_value { 0 }
  end
end

