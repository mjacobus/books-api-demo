class UserSeeder
  attr_reader :user

  def initialize(email:, access_token:)
    @user = User.find_or_initialize_by(email:) do |user|
      user.access_token = access_token
    end
    @user.save!
  end

  def seed
    seed_genres
    seed_publishers
    seed_authors
    seed_books
  end

  def seed_authors
    5.times do
      user.authors.find_or_create_by(name: Faker::Book.author)
    end

    puts "Seeded #{Author.count} authors for #{user.email}"
  end

  def seed_publishers
    5.times do
      user.publishers.find_or_create_by(name: Faker::Book.publisher)
    end

    puts "Seeded #{Publisher.count} publishers for #{user.email}"
  end

  def seed_genres
    5.times do
      user.genres.find_or_create_by(name: Faker::Book.genre)
    end

    puts "Seeded #{Genre.count} genres for #{user.email}"
  end

  def author
    user.authors.sample
  end

  def publisher
    user.publishers.sample
  end

  def genre
    user.genres.sample
  end

  def seed_books
    1.upto(10).each do
      FactoryBot.create(:book, author:, publisher:, genre:, user:, title: Faker::Book.title)
    end
  end
end

Book.destroy_all
Genre.destroy_all
Publisher.destroy_all
Author.destroy_all
User.destroy_all

seeder = UserSeeder.new(email: 'john@doe.com', access_token: 'token_one')
seeder.seed

seeder = UserSeeder.new(email: 'jane@doe.com', access_token: 'token_two')
seeder.seed
