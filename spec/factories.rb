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

FactoryGirl.define do
  factory :column do
    column_name "column"
    column_type_id "1"
    table_id "1"
  end
end

FactoryGirl.define do
  factory :row do
    row_data "some data"
  end
end