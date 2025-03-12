FactoryBot.define do
  factory :order_address do
    zipcode { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { '09000000000' }
    token { "tok_#{SecureRandom.hex(10)}" }
  end
end
