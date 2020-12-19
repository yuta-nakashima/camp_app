FactoryBot.define do
  factory :comment do
    comment  {Faker::Books::CultureSeries.book}
    association :user
    association :tweet
  end
end
