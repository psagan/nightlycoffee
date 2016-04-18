FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Title#{n}" }
    content "test content"
  end
end

