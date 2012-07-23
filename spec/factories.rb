FactoryGirl.define do
  factory :user do
    email "joe@gmail.com"
    password "password"
  end
end

FactoryGirl.define do
  factory :authentication do
    provider "facebook"
    uid "123456789"
  end
end

FactoryGirl.define do
  factory :table do
    table_name "table"
    table_desc "description"
  end
end