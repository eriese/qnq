# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
User.delete_all
u1 = User.new(name: "Enoch Riese", password: "password", password_confirmation: "password", fb_email: "rieseyspieceys@gmail.com", fb_pass: "password", gender: "femme", sexuality: "queer")
u1.save
u2 = User.new(name: "Nikki Padula", password: "password", password_confirmation: "password", fb_email: "padulanucole@yahoo.com", fb_pass: "password", gender: "femme", sexuality: "queer")
u2.save
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
