FactoryBot.define do
  factory :item do
    name                    {"onigiri"}
    info                    {Faker::Lorem.sentence}
    category_id             {2}
    sales_status_id         {2}
    delivery_charge_id      {13}
    scheduled_delivery_id   {3}
    prefecture_id           {2}
    price                   {"999"}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
