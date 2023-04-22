# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create :email => 'kyle@kiss.fm', :password => 'chicken'
u2 = User.create :email => 'jackieo@kiss.fm', :password => 'chicken'
puts "#{ User.count } users created."

Ammo.destroy_all
a1 = Ammo.create :name => 'PBP', :calibre => '9x19 Parabellum', :bullet_velocity => 560, :fragmentation_chance => 5, :ricochet_chance => 20, :quantity => 60, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/e/eb/7N31Icon.png'
a2 = Ammo.create :name => 'M995', :calibre => '5.56x45mm NATO', :bullet_velocity => 1013, :fragmentation_chance => 20, :ricochet_chance => 36, :quantity => 32, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/b/b6/M995ICON.png'
a3 = Ammo.create :name => 'M61', :calibre => '7.62x51mm NATO', :bullet_velocity => 849, :fragmentation_chance => 13, :ricochet_chance => 30, :quantity => 20, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/e/e3/M61ICON.png'
a4 = Ammo.create :name => 'PPBS gs "Igolnik"', :calibre => '5.45x39mm', :bullet_velocity => 905, :fragmentation_chance => 2, :ricochet_chance => 38, :quantity => 60, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/6/64/7n39icon.png'
puts "#{ Ammo.count } ammos created."

Firearm.destroy_all
f1 = Firearm.create :model => 'MP5', :calibre => '9x19 Parabellum', :family => 'Submachine Gun', :fire_rate => 800, :effective_distance => 200, :quantity => 60, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/5/54/Mp5.png'
f2 = Firearm.create :model => 'M4A1', :calibre => '5.56x45mm NATO', :family => 'Assault Rifle', :fire_rate => 800, :effective_distance => 500, :quantity => 40, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/2/29/M4a1.png'
f3 = Firearm.create :model => 'SA-58', :calibre => '7.62x51mm NATO', :family => 'Assault Rifle', :fire_rate => 700, :effective_distance => 900, :quantity => 20, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/a/ae/DS_Arms_SA-58_OSW_Para_7.62x51.png'
f4 = Firearm.create :model => 'AK-74N', :calibre => '5.45x39mm', :family => 'Assault Rifle', :fire_rate => 650, :effective_distance => 650, :quantity => 56, :image => 'https://static.wikia.nocookie.net/escapefromtarkov_gamepedia/images/8/84/Akn.png'
puts "#{ Firearm.count } firearms created."

Manufacturer.destroy_all
m1 = Manufacturer.create :name => 'Heckler & Koch', :founder => 'Edmund Heckler, Theodor Koch, Alex Seidel', :founded => 1949, :country => 'Germany', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/HK_Logo.svg/440px-HK_Logo.svg.png'
m2 = Manufacturer.create :name => "Colt's Manufacturing Company", :founder => 'Samuel Colt', :founded => 1855, :country => 'America', :image => 'https://upload.wikimedia.org/wikipedia/en/thumb/d/da/Colt_logo.svg/440px-Colt_logo.svg.png'
m3 = Manufacturer.create :name => 'Fabrique Nationale Herstal', :founder => 'Henri Pieper', :founded => 1889, :country => 'Belgium', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/FN-Herstal-logo.svg/400px-FN-Herstal-logo.svg.png'
m4 = Manufacturer.create :name => 'JSC Kalashnikov Concern', :founder => 'Alexander 1, Mikhail Kalashnikov', :founded => 1807, :country => 'Russia', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/KalashnikovConcern.svg/300px-KalashnikovConcern.svg.png'
puts "#{ Manufacturer.count } manufacturers created."

puts "Users and ammos"
u1.ammos << a1
u1.ammos << a2
u1.ammos << a3
u2.ammos << a2
u2.ammos << a3
u2.ammos << a4

puts "Users and firearms"
u1.firearms << f1
u1.firearms << f2
u1.firearms << f3
u2.firearms << f2
u2.firearms << f3
u2.firearms << f4

puts "Ammos and firearms"
a1.firearms << f1
a2.firearms << f2
a3.firearms << f3
a4.firearms << f4

puts "Firearms and ammos"
f1.ammos << a1
f2.ammos << a2
f3.ammos << a3
f4.ammos << a4

puts "Manufacturers and firearms"
m1.firearms << f1
m2.firearms << f2
m3.firearms << f3
m4.firearms << f4