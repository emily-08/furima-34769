FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture { 8 }
    city { '川崎' }
    block { '青山1-1' }
    building { '東京ハイツ' }
    phone_number { '08012345678' }
  end
end