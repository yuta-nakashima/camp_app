FactoryBot.define do
  factory :tweet do
    title           {Faker::Ancient.god}
    start_time      {Faker::Date.between(from: "2019-01-01", to: "2020-12-31")}
    prefecture_id   {Faker::Number.between(from: 1, to: 47)}
    place           {Faker::Name.initials}
    wanted_list     {Faker::Food.dish}
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open("public/images/test_BBQ2.png"),filename: "test_BBQ2.png")
      tweet.item_image.attach(io: File.open("public/images/test_BBQ2.png"),filename: "test_BBQ2.png")
      tweet.memory_images.attach(io: File.open("public/images/test_BBQ2.png"),filename: "test_BBQ2.png")
    end
  end
end
