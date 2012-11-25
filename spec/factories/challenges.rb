# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge do
    title "MyString"
    description "MyText"
    start "2012-11-24 22:21:51"
    stop "2012-11-24 22:21:51"
    limit false
    validation "MyString"
    points 1
    prize "MyString"
    badge "MyString"
    complete false
    competition nil
  end
end
