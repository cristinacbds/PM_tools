FactoryBot.define do
  factory :project do
    title { "Hello" }
    description { "This is a test for validations" }
    due_date { '2020-01-13' }
  end
end
