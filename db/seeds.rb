# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = [{:title => 'Aladdin', :year => '1992', :description => 'Basada en el famoso cuento "Aladino y la lámpara maravillosa", la trama se sitúa en el exótico paisaje del mítico reino árabe de Agrabah. Aladdin es un ingenioso joven que, a pesar de vivir en un estado de extrema pobreza, sueña con casarse con la bella hija del sultán, la princesa Yasmin. El destino interviene cuando el astuto visir del Sultán, Yafar, recluta a Aladdin para que le ayude a recuperar una lámpara mágica de las profundidades de la Cueva de las Maravillas. El joven encuentra la lámpara, en la que vive un genio que concede tres deseos a quien lo libere.'},
          {:title => 'The Terminator', :year => '1984', :description => 'Los Ángeles, año 2029. Las máquinas dominan el mundo. Los rebeldes que luchan contra ellas tienen como líder a John Connor, un hombre que nació en los años ochenta. Para acabar con la rebelión, las máquinas deciden enviar al pasado a un robot -Terminator- cuya misión será eliminar a Sarah Connor, la madre de John, e impedir así su nacimiento.'},
          {:title => 'When Harry Met Sally', :year => '1989', :description => 'Harry Burns (Billy Cristal) y Sally Albright (Meg Ryan) son dos estudiantes universitarios que se conocen por casualidad, cuando ella se ofrece a llevar Harry en su coche. Durante el viaje hablan sobre la amistad entre personas de diferente sexo y sus opiniones son absolutamente divergentes: mientras que Harry está convencido de que la amistad entre un hombre y una mujer es imposible, Sally cree lo contrario. A pesar de ello, pasan los años y su relación continúa.'},
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
  description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nisl enim, tempor id ullamcorper vel, posuere eu dui. Ut placerat felis eros, ac sagittis lorem mollis cursus. Aliquam erat volutpat. Integer non risus auctor, imperdiet est tempor, lacinia magna. Vestibulum et ligula quis felis dictum porta. Praesent in turpis semper, finibus nisl eget, convallis metus. Mauris quis maximus eros. Sed dolor nibh, imperdiet ac justo id, bibendum tincidunt neque. Nam dapibus suscipit mattis. Fusce sollicitudin accumsan ligula sed suscipit. Cras."
  Movie.create!(title: title, year: year, description: description)
end

Admin.create(email: 'admin@homie.mx', password: 'admin123', password_confirmation: 'admin123')