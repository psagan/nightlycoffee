FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@nightlycoffee.com" }
    password "password"
    admin false

    factory :admin_user do
      admin true
    end
  end
end

