# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{name: 'catalina',nickname: 'cata',email:'cb@gmail.com',country:'chile',city:'santiago',biography:'student of engineering',password:'123456789',photo:'123.png',location:'hello'},
             {name: 'ernesto rios',nickname: 'tito',email:'tt@gmail.com',country:'chile',city:'santiago',biography:'student of engineering',password:'autos',photo:'123.png',location:'codegua'},
             {name: 'rosario bosch',nickname: 'ro',email:'ro@gmail.com',country:'españa',city:'madrid',biography:'student of engineering ',password:'rosario',photo:'123.png',location:'universidad de los andes'}])
Post.create([{title:'cars',description:'in the parking area a car is parked badly',user_id: 1,type_of_post:'open',country:'chile',city:'santiago',photo:'picture.png',file:'file.png',location:'universidad de los andes'},
             {title:'tests',description:'we have to much thing to do for the university and we dont have time for other things',user_id: 1,type_of_post:'open',country:'chile',city:'santiago',photo:'picture1.png',file:'file2.png',location:'universidad de los andes'},
            {title:'class',description:'today in the class the teacher take my airpods and didnt give me back so now i dont have airpods',user_id: 1,type_of_post:'open',country:'chile',city:'santiago',photo:'picture4.png',file:'fil4e.png',location:'europe'},
             {title:'phone',description:'today in the bus some boy stole my phone  so now i dont have phone',user_id: 2,type_of_post:'open',country:'chile',city:'santiago',photo:'picture3.png',file:'file3.png',location:'chile'}])
Adminstrator.create([{name:'catalina sanchez', password: 'especial', nickname: 'cata2222', email:'cb@gmail.com' , country: 'chile', city:'santiago'}])
SuperAdmin.create([{name:'claudio alvarez', password:'teacher', nickname:'clal', email:'cbalvarez@uandes.cl', e_password: 'onlyone'}])
BlackList.create([{user_id: 3}])
DumpList.create([{post_id:4}])
Commentary.create([{texto:'you have to go with your phone in the backpack', country:'chile', city: 'santiago', user_id: 3, post_id: 1, photo: 'document.png', file: 'document.pdf', location:'chile'}])

