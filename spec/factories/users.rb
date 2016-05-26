FactoryGirl.define do
  factory :user, class: User do
    email "test@test.com"
    password "test1234"
  end
end
