FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"hoge12"}
    password_confirmation {password}
    last_name { "山田" }
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth {Faker::Date.birthday}
  end
end
