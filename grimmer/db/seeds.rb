# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1= User.create([{name: 'catalina',nickname: 'cata',email:'cb@gmail.com',country:'chile',city:'santiago',biography:'student of engineering',password:'123456789',photo:'123.png',location:'hello'}])
Post.create([{title:'cars',description:'in the parking area a car is parked badly',user: user1,type_of_post:'open',country:'chile',city:'santiago',photo:'picture.png',file:'file.png',location:'universidad de los andes'}])