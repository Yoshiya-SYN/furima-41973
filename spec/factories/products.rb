FactoryBot.define do
  factory :product do
    title                 {Faker::Lorem.sentence}
    description           {Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    condition_id          {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id       {Faker::Number.between(from: 2, to: 3)}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    shipping_date_id      {Faker::Number.between(from: 2, to: 4)}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end

  end
end
