FactoryBot.define do
  factory :user do

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name           {"大久保"}
    first_name_kana      {"オオクボ"}
    last_name            {"精剛"}
    last_name_kana       {"セイゴウ"}
    birth                {"2000-01-01"}
  end
end