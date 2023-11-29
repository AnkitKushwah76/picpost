FactoryBot.define do
  factory :comment do
    content { 'Test' }
    user_id { 11 }
    post_id { 11 }
  end
end
