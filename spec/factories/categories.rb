FactoryBot.define do
  factory :category do
    name { Faker::Company.name }
    icon { Faker::Company.logo }
    user { nil }

    factory :category_entities do
      transient do
        entities_count { 10 }
      end

      entities do
        Array.new(entities_count) { association(:entity) }
      end
    end
  end
end
