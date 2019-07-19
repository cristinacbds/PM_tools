FactoryBot.define do
  factory :user do
    first_name { "Cristina" }
    last_name { "Souza" }
    email { "lalala@example.com" }
    password_digest { "12345678" }
  end
end
