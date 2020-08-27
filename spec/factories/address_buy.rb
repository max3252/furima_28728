FactoryBot.define do
  factory :address_buy do
    postal_code { '123-1234' }
    prefecture_id { '2' }
    city { '一二三市一二三町' }
    address_line1 { '一二三1-1' }
    address_line2 { '一二三ハイツ101' }
    phone_num { '09012341234' }
  end
end
