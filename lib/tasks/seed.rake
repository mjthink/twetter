require 'ffaker'

namespace :seed do
  desc "Create 20 users"
  task :users => :environment do
    20.times do
      User.create!(:email => Faker::Internet.email, :name => Faker::Name.name, :password => Faker.bothify("####????##??"), :username => Faker::Name.first_name)
    end
  end
end
