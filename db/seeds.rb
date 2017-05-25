# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = [{:title => 'Aladdin', :year => '1992'},
          {:title => 'The Terminator', :year => '1984'},
          {:title => 'When Harry Met Sally', :year => '1989'},
          {:title => 'The Help', :year => '2011'},
          {:title => 'Chocolat', :year => '2001'},
          {:title => 'Amelie', :year => '2001'},
          {:title => '2001: A Space Odyssey', :year => '1968'},
          {:title => 'The Incredibles', :year => '2004'},
          {:title => 'Raiders of the Lost Ark', :year => '1981'},
          {:title => 'Chicken Run', :year => '2000'},
]

movies.each do |movie|
  Movie.create!(movie)
end

99.times do |n|
  title = "Película número #{n}"
  year = "200#{n}"
  Movie.create!(title: title, year: year)
end