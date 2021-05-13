FactoryBot.define do
  factory :user do

    nickname              {Faker::Name.initials(number: 2)}
    email                 {"hoge@example.com"}

    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name           {"中村"}
    first_name_kana      {"ナカムラ"}
    last_name            {"勇気"}
    last_name_kana       {"ユウキ"}
    birth                {"2000-01-01"}
  end
end