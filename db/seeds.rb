# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(email: 'test@example.com')

30.times do |i|
  user.goals.create!(
    name: "Goal #{i}",
    amount: rand(100_000),
    target_date: 1.day.from_now,
    recurrance: Goal::RECURRANCES.sample
  )
end

Goal.all.each do |goal|
  goal.update_column(:target_date, Time.zone.now + rand(-100...100).days)
end
