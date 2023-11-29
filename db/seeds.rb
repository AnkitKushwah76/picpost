# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Seed Users
users = []
5.times do
  user = User.create(
    username: Faker::Internet.unique.username(specifier: 5..8),
    email: Faker::Internet.email,
    password: 'password'
  )
  users << user
end

# Seed Posts with Image and Comments
users.each do |user|
  5.times do
    post = Post.create(
      caption: Faker::Lorem.paragraph,
      user: user
    )

    # Attach Image  Post
    file_path = Rails.root.join('public', 'example.jpeg')
    post.image.attach(io: File.open(file_path), filename: 'example.jpeg', content_type: 'image/png')

    # Seed Comments for the Post
    3.times do
      Comment.create(
        post: post,
        user: users.sample,
        content: Faker::Lorem.paragraph
      )
    end
  end
end
