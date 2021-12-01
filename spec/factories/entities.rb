FactoryBot.define do
  factory :entity do
    name { Faker::Commerce.product_name }
    amount { Faker::Commerce.price }
    user { nil }

    factory :entities_categories do
      transient do
        categories_count { 10 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end
    end
  end
end
