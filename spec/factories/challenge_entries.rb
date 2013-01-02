# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge_entry do
    association :competition_entry, strategy: :create
    association :challenge, strategy: :create
    complete true
  end
end
