# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.delete_all
Task.delete_all

10.times do
    Project.create(
        title: Faker::BossaNova.song,
        description: Faker::BossaNova.artist,
        due_date: Faker::Date.forward(30)
    )
end

10.times do
    Task.create(
        title: Faker::Dessert.flavor,
        due_date: Faker::Date.forward(30)
    )
end
