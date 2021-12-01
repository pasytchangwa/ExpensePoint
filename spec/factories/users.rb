FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { 'mypassword' }
  
    factory :user_categories do
      transient do
        categories_count { 10 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end

      factory :user_entities do
        transient do
          entities_count { 10 }
        end

        entities do
          Array.new(entities_count) { association(:entity) }
        end
      end
    end
  end
end