FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "login #{n}"
    end
    email
    
  end
end
