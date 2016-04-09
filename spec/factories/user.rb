FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password_digest 'password'
    sequence :name do |n|
      "RandoPerson#{n}"
    end
  end
end
