FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 {Faker::Internet.email}
    password              { 'abc000' }
    password_confirmation { password }
    lastname              { '田中' }
    firstname             { '太郎' }
    lastname_kana         { 'タナカ' }
    firstname_kana        { 'タロウ' }
    birth_date            { Date.new(1986, 1, 23) }
  end
end
