# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :competition do
    association :user, factory: :user, strategy: :create
    name "First Competition"
    startTime { DateTime.now + 2.days }
    endTime { DateTime.now + 2.days + 2.hours }
  end
end
