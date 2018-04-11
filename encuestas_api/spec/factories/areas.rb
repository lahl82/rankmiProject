FactoryBot.define do
  factory :area do
    name { Faker::Commerce.department(1,true) }
    result { Faker::Number.between(0,10) }
    parent_id  nil
  end
end
