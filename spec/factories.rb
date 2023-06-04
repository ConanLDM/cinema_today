FactoryBot.define do
  factory :review do
    content { "MyText" }
    film { nil }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
