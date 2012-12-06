# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge_entry do
    competition_entry nil
    challenge nil
    complete false
  end
end
