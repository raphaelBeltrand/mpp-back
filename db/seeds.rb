# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

User.destroy_all
Group.destroy_all
Team.destroy_all

(1..50).each do |_|
    User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: "123456")
end

(1..10).each do |_|
    Group.create!(name: Faker::Esport.unique.team, public: true)
end

(1..10).each do |_|
    Group.create!(name: Faker::DcComics.unique.title, public: false)
end

Group.all.each do |e|
    (0..(rand(10) + 1)).each do |_|
        begin
            GroupUser.create!(user: User.order("RANDOM()").take, group: e)
        rescue
            next
        end
    end
end

GroupUser.all.each do |e|
    team = Team.create!(group_user: e)
    (0..5).each do |_|
        PoliticianTeam.create!(team: team, politician: Politician.order("RANDOM()").take)
    end
end