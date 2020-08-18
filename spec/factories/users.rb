FactoryBot.define do
  factory :user do
    nickname {"tanaka"}
    email {"ttt@gmail.com"}
    password {"abc123"}
    password_confirmation {password}
    family_name {"田中"}
    first_name {"太郎"}
    family_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_day {"2000/01/01"}
  end
end