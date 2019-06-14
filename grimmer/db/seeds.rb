# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{name: 'Catalina Sanchez',nickname: 'cata',email:'cbsanchez@gmail.com',country:'Chile',city:'Santiago',biography:'I am studying industrial engineering in Universidad De Los Andes. I like go to the cinema.',password:'123456789',location:'hello'},
             {name: 'Ernesto Rios',nickname: 'tito',email:'tt@gmail.com',country:'Chile',city:'Santiago',biography:'I am a student of Universidad de los Andes in Chile and want to express my anger in this page.  ',password:'autos123',location:'codegua'},
             {name: 'Rosario Bosch',nickname: 'ro',email:'ro@gmail.com',country:'España',city:'Madrid',biography:'I like to play sports and climb mountains.',password:'rosario',location:'universidad de los andes'}])
Post.create([{title:'Lost my car in the parking lot',description:'Today I arrive late at the university and park fast so now I dont remember where I left the car. Please someone help me!',user_id: 1,type_of_post:'open',country:'Chile',city:'Santiago'},
             {title:'I have two exams in the same day',description:'Today I realise that in next tuesday I have two exams. I am really angry because we have to much thing to do for the university and we dont have time for other things',user_id: 1,type_of_post:'open',country:'Chile',city:'Santiago'},
            {title:'The central building coffee is too expensive',description:'I am really piss of with the prices of the coffee in the central building. Yesterday I ask fo a sandwich and a glass of water and they charge my $5.000!',user_id: 1,type_of_post:'open',country:'Chile',city:'Santiago'},
             {title:'Thief in the bus',description:'Today in the bus a boy stole my phone, so now I cant see instagram during the class. Now I am really bored',user_id: 2,type_of_post:'open',country:'chile',city:'santiago'}])
Adminstrator.create([{name:'Catalina Sanchez', password: 'especial', nickname: 'cata2222', email:'cb@gmail.com' , country: 'Chile', city:'Santiago'}])
SuperAdmin.create([{name:'Claudio Alvarez', password:'teacher', nickname:'Claudio123', email:'calvarez1@miuandes.cl', e_password: 'onlyone'}])
BlackList.create([{user_id: 3}])
DumpList.create([{post_id:3}])
Commentary.create([{texto:'Did you search in the other parking lot?', country:'Chile', city: 'Santiago', user_id: 3, post_id: 1, location:'chile'}])

