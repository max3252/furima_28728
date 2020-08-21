FactoryBot.define do
  factory :item do
    name { 'content' }
    text { 'info' }
    price { '1000' }
    category_id { '2' }
    status_id { '2' }
    prefecture_id { '2' }
    burden_id { '2' }
    day_id { '2' }
    association :user
  end
end
