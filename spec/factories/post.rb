FactoryBot.define do
  factory :post do
    caption { 'Hello' }
    user_id { 1 }

    # Example of attaching an image using Active Storage
    after(:build) do |post|
      post.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
