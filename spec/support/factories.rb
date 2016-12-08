FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "login #{n}"
    end
  end
end
