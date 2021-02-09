User.destroy_all
List.destroy_all
Product.destroy_all
Category.destroy_all


puts 'Create users'

file_marc = File.open(Rails.root.join('db/fixtures/users/marc.jpg'))
marc = User.create!(first_name: 'Marc', last_name:'Jourdan', email: 'marcjourdan@gmail.com', password: 'marc123')
marc.photo.attach(io: file_marc, filename: 'marc.jpg', content_type: 'image/jpg')


puts 'Create lists'

file_leo_list = File.open(Rails.root.join('db/fixtures/lists/cover.jpg'))
leo_list = List.create!(title: 'Liste de naissance de Léo', birth_date: '15/02/1995', user: marc)
leo_list.picture.attach(io: file_leo_list, filename: 'cover.jpg', content_type: 'image/jpg')

file_pio_list = File.open(Rails.root.join('db/fixtures/lists/baby-pio.jpg'))
pio_list = List.create!(title: 'Liste de naissance de Pio', birth_date: '12/04/2021', user: marc)
pio_list.picture.attach(io: file_pio_list, filename: 'baby-pio.jpg', content_type: 'image/jpg')


puts 'Create categories'

dormir = Category.create!(name: 'Au lit', list: leo_list)
manger = Category.create!(name: 'À table', list: leo_list)
jouer = Category.create!(name: 'Les jeux', list: leo_list)


puts 'Create products'

file_couffin = File.open(Rails.root.join('db/fixtures/products/couffin.jpg'))
couffin = Product.create!(name: 'Panier couffin', url: 'https://www.jacadi.fr/chambre-de-bebe/mobilier/Panier-couffin/p/1082059_606?utm_source=CJ&utm_medium=affiliation&utm_campaign=4669255&cjevent=850d71d5648b11eb827b019a0a18050e', price: 49.11, list: leo_list)
couffin.picture.attach(io: file_couffin, filename: 'couffin.jpg', content_type: 'image/jpg')

file_chaise = File.open(Rails.root.join('db/fixtures/products/tripptrapp.webp'))
chaise = Product.create!(name: 'CHAISE TRIPP TRAPP', url: 'https://www.stokke.com/FRA/fr-fr/chaises-hautes/tripp-trapp/1001.html#!/configurator', price: 209, list: leo_list)
chaise.picture.attach(io: file_chaise, filename: 'tripp-trapp.webp', content_type: 'image/jpg')

file_crabe = File.open(Rails.root.join('db/fixtures/products/crabe.jpg'))
crabe = Product.create!(name: 'Crabe pour le bain en caoutchouc naturel Jaune', url: 'https://fr.smallable.com/crabe-pour-le-bain-en-caoutchouc-naturel-jaune-tikiri-171073.html?awc=7104_1612183754_9caa9f26c4d82267a40f0ddabe745c33&ectrans=1&utm_campaign=281833&utm_medium=referral&utm_source=affiliatewindow', price: 14, list: leo_list)
crabe.picture.attach(io: file_crabe, filename: 'crabe.jpg', content_type: 'image/jpg')

puts 'Seeds finish'
