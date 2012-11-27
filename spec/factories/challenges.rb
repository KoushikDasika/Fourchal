# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge do
    association :competition, strategy: :create
    title "MyString"
    description "MyText"
    start { DateTime.now + 2.days}
    stop  { DateTime.now + 2.days + 2.hours}
    limit false
    validation "MyString"
    points 1
    prize "MyString"
    badge "MyString"
    complete false
  end
end
