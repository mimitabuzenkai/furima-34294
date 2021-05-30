FactoryBot.define do
  factory :order_pay_form do
    postal_code               {"123-1234"}
    prefecture_id             {2}
    city                      {"横浜市緑区"}
    addresses                 {"青山1-1-1"}
    building                  {"柳ビル"}
    phone_number              {"09012345678"}
    token                     {"aaaa"}
  end
end