require "open-uri"

puts "Delete all tables"

Dog.destroy_all
puts "Dogs deleted"
Favourite.destroy_all
puts "Favourites deleted"
Review.destroy_all
puts "Reviews deleted"
UserReward.destroy_all
puts "User Rewards deleted"
Reward.destroy_all
puts "Rewards deleted"
Ride.destroy_all
puts "Rides deleted"
Course.destroy_all
puts "Courses deleted"
User.destroy_all
puts "Users deleted"

puts "All tables deleted"

user1 = User.new(email: "flo@gmail.com", password: "azerty", firstname: "Florian", lastname: "GAGNAIRE", nickname: "Metalzoid")
user1photo = URI.open("https://media.licdn.com/dms/image/D4E03AQGUuZaaPoQ0Ww/profile-displayphoto-shrink_200_200/0/1699822402485?e=1723680000&v=beta&t=4hErdlY2ghxSPKJ43SLs7lYOE_-fDjYVU3hd9Gsun4g")
user1.photo.attach(io: user1photo, filename: "photo.jpg", content_type: "image/jpg")
user1.save!
puts "user : #{user1.firstname} done"
user1dog1 = Dog.new(name: "Yuna", race: "Border Colie", age: 2, user: user1)
user1dog1_photo = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717522898/development/yuna_yltisx.jpg")
user1dog1.photo.attach(io: user1dog1_photo, filename: "yuna.jpg", content_type: "image/jpg")
user1dog1.save!
puts "dog : #{user1dog1.name} done !"


user2 = User.new(email: "audrey@gmail.com", password: "azerty", firstname: "Audrey", lastname: "audrey", nickname: "Audrey-ady")
user2photo = URI.open("https://scontent-cdg4-2.xx.fbcdn.net/v/t39.30808-6/350473759_1879063185812224_1755802817563074239_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ImBuGzkuDb4Q7kNvgGTWqrh&_nc_ht=scontent-cdg4-2.xx&oh=00_AYAvFVB4b_qXrVVafoxFGIrtUZePT3_0kanvsLJQY8U1Yg&oe=6670B51B")
user2.photo.attach(io: user2photo, filename: "photo.jpg", content_type: "image/jpg")
user2.save!
puts "user : #{user2.firstname} done"
user2dog1 = Dog.new(name: "Bouboule", race: "Bouledog français", age: 2, user: user2)
user2dog1_photo = URI.open("https://img.freepik.com/photos-gratuite/mignon-bouledogue-francais-noir-blanc-est-assis-regarde-droit-dans-appareil-photo-chien-assis-feuilles-automne-jaunes-pendant-belle-journee-automne-chien-bouledogue-francais-serieux-debout-exterieur-automne_1157-51428.jpg?t=st=1718279877~exp=1718283477~hmac=9c4ce0b524123bb759578c5cae4574884fdb645f8036796fa38da01c8c714737&w=500")
user2dog1.photo.attach(io: user2dog1_photo, filename: "bouboule.jpg", content_type: "image/jpg")
user2dog1.save!
puts "dog : #{user2dog1.name} done !"



user3 = User.new(email: "jennifer@gmail.com", password: "azerty", firstname: "Jennifer", lastname: "jen", nickname: "CrewmateOnly")
user3photo = URI.open("https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?t=st=1718279527~exp=1718283127~hmac=4fe3493c0437b8fabd207623925e72c4bf6cb7d55c755e8e1ff328607c63a0b8&w=500")
user3.photo.attach(io: user3photo, filename: "photo.jpg", content_type: "image/jpg")
user3.save!
puts "user : #{user3.firstname} done"
user3dog1 = Dog.new(name: "Rocket", race: "Boceron", age: 5, user: user3)
user3dog1_photo = URI.open("https://files.slack.com/files-pri/T02NE0241-F0773JW7GSF/20240518_175533.jpg")
user3dog1.photo.attach(io: user3dog1_photo, filename: "Rocket.jpg", content_type: "image/jpg")
user3dog1.save!
puts "dog : #{user3dog1.name} done !"


user4 = User.new(email: "nicolas@gmail.com", password: "azerty", firstname: "Nicolas", lastname: "Thouvenot", nickname: "Nicothvtdb")
user4photo = URI.open("https://avatars.githubusercontent.com/u/167056313?v=4")
user4.photo.attach(io: user4photo, filename: "photo.jpg", content_type: "image/jpg")
user4.save!
puts "user : #{user4.firstname} done"
user4dog1 = Dog.new(name: "Popeye", race: "Golden Retreiver", age: 7, user: user3)
user4dog1_photo = URI.open("https://img.freepik.com/photos-premium/golden-retriever-assis-devant-mur-blanc_191971-19102.jpg?w=500")
user4dog1.photo.attach(io: user4dog1_photo, filename: "Popeye.jpg", content_type: "image/jpg")
user4dog1.save!
puts "dog : #{user4dog1.name} done !"


user5 = User.new(email: "hector@gmail.com", password: "azerty", firstname: "Hector", lastname: "Dupont", nickname: "hecdpt")
user5photo = URI.open("https://img.freepik.com/photos-premium/jeune-mec-positif-barbe-rouge-sweat-shirt-orange-vif-regardant-dans-camera-souriant-fond-bleu-isole_197531-27744.jpg?w=500")
user5.photo.attach(io: user5photo, filename: "photo.jpg", content_type: "image/jpg")
user5.save!
puts "user : #{user5.firstname} done"
user5dog1 = Dog.new(name: "Jasper", race: "Golden Retreiver", age: 7, user: user3)
user5dog1_photo = URI.open("https://img.freepik.com/photos-premium/golden-retriever-assis-devant-mur-blanc_191971-19102.jpg?w=500")
user5dog1.photo.attach(io: user5dog1_photo, filename: "Popeye.jpg", content_type: "image/jpg")
user5dog1.save!
puts "dog : #{user5dog1.name} done !"


user6 = User.new(email: "louis@gmail.com", password: "azerty", firstname: "Louis", lastname: "Dupontel", nickname: "louidptl")
user6photo = URI.open("https://img.freepik.com/photos-gratuite/confiant-beau-mec-posant-contre-mur-blanc_176420-32936.jpg?w=500")
user6.photo.attach(io: user6photo, filename: "photo.jpg", content_type: "image/jpg")
user6.save!
puts "user : #{user6.firstname} done"
user6dog1 = Dog.new(name: "Chili", race: "Golden Retreiver", age: 7, user: user3)
user6dog1_photo = URI.open("https://img.freepik.com/photos-premium/golden-retriever-assis-devant-mur-blanc_191971-19102.jpg?w=500")
user6dog1.photo.attach(io: user6dog1_photo, filename: "Popeye.jpg", content_type: "image/jpg")
user6dog1.save!
puts "dog : #{user6dog1.name} done !"


user7 = User.new(email: "ismael@gmail.com", password: "azerty", firstname: "Ismael", lastname: "LeBG", nickname: "IsmaBG")
user7photo = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1713177689/hocxosuksmc1oxn5qzxu.jpg")
user7.photo.attach(io: user7photo, filename: "photo.jpg", content_type: "image/jpg")
user7.save!
puts "user : #{user7.firstname} done"
user7dog1 = Dog.new(name: "Bébou", race: "Golden Retreiver", age: 7, user: user3)
user7dog1_photo = URI.open("https://img.freepik.com/photos-premium/golden-retriever-assis-devant-mur-blanc_191971-19102.jpg?w=500")
user7dog1.photo.attach(io: user7dog1_photo, filename: "Popeye.jpg", content_type: "image/jpg")
user7dog1.save!
puts "dog : #{user7dog1.name} done !"


user8 = User.new(email: "julie@gmail.com", password: "azerty", firstname: "Julie", lastname: "Patati", nickname: "Juliepat")
user8photo = URI.open("https://img.freepik.com/photos-gratuite/jeune-femme-posant-portant-robe-feminine-elegante-mode-accessoires-paille_291049-179.jpg?size=500")
user8.photo.attach(io: user8photo, filename: "photo.jpg", content_type: "image/jpg")
user8.save!
puts "user : #{user8.firstname} done"
user8dog1 = Dog.new(name: "Chanoir", race: "Golden Retreiver", age: 7, user: user3)
user8dog1_photo = URI.open("https://img.freepik.com/photos-premium/golden-retriever-assis-devant-mur-blanc_191971-19102.jpg?w=500")
user8dog1.photo.attach(io: user8dog1_photo, filename: "Popeye.jpg", content_type: "image/jpg")
user8dog1.save!
puts "dog : #{user8dog1.name} done !"

#--------------- REWARDS-----------------
reward1 = Reward.create!(price: 63.99, name: "ROYAL CANIN Maxi Adulte", reduction: 30, promocode: "MAXIZOO30", link: "https://www.maxizoo.fr/p/royal-canin-maxi-adulte-croquettes-chien-15-kg-1803883/", money: 230, description: "Digestion favorisée, protection osseuse et articulaire, contient des acides gras oméga 3 : EPA et DHA")
reward1photo = URI.open("https://media.os.fressnapf.com/products-v2/a/b/2/3/ab239d62865ca238b683c5e1ac8c2955e5fbd044_1003112004__2_.jpeg")
reward1.photo.attach(io: reward1photo, filename: "royal.jpg", content_type: "image/jpeg")
puts "reward : #{reward1.name}"


reward2 = Reward.create!(price: 44.99, name: "Harnais anti-traction", reduction: 25, promocode: "MAXIZOO25", link: "https://www.maxizoo.fr/p/dogs-creek-harnais-anti-traction-pathfinder-vert-s-1404978/", money: 260, description: "Réflecteurs 3M™ Scotchlite™, fermoir Duraflex sûr, solide et réglable, anti-traction grâce au mousqueton ventral")
reward2photo = URI.open("https://media.os.fressnapf.com/products-v2/0/a/7/b/0a7b028775a8f8fefde8ca1ea362b9c03a170588_1404978_1404979_1404980_1404981_DC_H.png")
reward2.photo.attach(io: reward2photo, filename: "creek.jpg", content_type: "image/png")
puts "reward : #{reward2.name}"


reward3 = Reward.create!(price: 74.99, name: "Traceur GPS pour chiens", reduction: 15, promocode: "MAXIZOO15", link: "https://www.maxizoo.fr/p/fressnapf-traceur-gps-pour-chiens-1404387/", money: 215, description: "Suivi GPS avec localisation précise, fixation facile au harnais ou au collier grâce à une bande velcro, sans abonnement, 2 ans sans frais courants")
reward3photo = URI.open("https://media.os.fressnapf.com/products-v2/7/a/c/8/7ac862fd6dd225fbb610606877bda0d93688c8e4_1404387_0_traceur.jpg")
reward3.photo.attach(io: reward3photo, filename: "fress.jpg", content_type: "image/jpg")
puts "reward : #{reward3.name}"


reward4 = Reward.create!(price: 59.99, name: "Cage de transport", reduction: 10, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/trixie-cage-de-transport-home-m-1038197/", money: 235, description: "S’ouvre à l’avant et sur le côté, pliable et peu encombrant à ranger, avec 2 portes et bac en plastique")
reward4photo = URI.open("https://media.os.fressnapf.com/products-v2/c/3/f/9/c3f9398bd72c9a0b0226fbcaf356834a5226cf43_86780a2cc7e285fa5081268163c35d69db0de25d.jpg")
reward4.photo.attach(io: reward4photo, filename: "trixie.jpg", content_type: "image/jpg")
puts "reward : #{reward4.name}"


reward5 = Reward.create!(price: 13.89, name: "Kong Classic", reduction: 10, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/kong-classic-m-1005027/", money: 60, description: "Idéal pour remplir avec des snacks, fabriqués aux États-Unis, saute et se rebondit de manière complètement imprévisible, idéal pour jouer à rapporter")
reward5photo = URI.open("https://media.os.fressnapf.com/products-v2/9/1/1/9/9119350a3fd857772af2927ee0315e2d2ee0ecd9_57dcdc84b89db66e574b54aa2b69ba805339e5b1.jpg")
reward5.photo.attach(io: reward5photo, filename: "kong.jpg", content_type: "image/jpg")
puts "reward : #{reward5.name}"


reward6 = Reward.create!(price: 15.99, name: "KONG Jumbler Ball", reduction: 15, promocode: "MAXIZOO15", link: "https://www.maxizoo.fr/p/kong-jumbler-ball-m-l-1211502/", money: 55, description: "Deux jouets en un, stimule le divertissement continu, Les poignées facilitent le ramassage et le secouage")
reward6photo = URI.open("https://media.os.fressnapf.com/products-v2/3/9/7/0/39709bf5859c9cbe2e8fac4599ed43316dfd42a9_8075c9340b78ed3ffd42d1fdda8d0cc75253a169.jpg")
reward6.photo.attach(io: reward6photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward6.name}"


reward7 = Reward.create!(price: 15.99, name: "Bâton à craquements", reduction: 15, promocode: "MAXIZOO15", link: "https://www.maxizoo.fr/p/dogs-creek-bton--craquements-tpr-adventure-1246734/", money: 75, description: "Extrêmement résistant, aux bruits de craquement, flottante")
reward7photo = URI.open("https://media.os.fressnapf.com/products-v2/9/1/1/9/9119350a3fd857772af2927ee0315e2d2ee0ecd9_57dcdc84b89db66e574b54aa2b69ba805339e5b1.jpg")
reward7.photo.attach(io: reward7photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward7.name}"


reward8 = Reward.create!(price: 14.69, name: "KONG Frisbee rouge", reduction: 15, promocode: "MAXIZOO15", link: "https://www.maxizoo.fr/p/kong-frisbee-rouge-l-1005040/", money: 92, description: "En caoutchouc naturel robuste KONG Classic, Respectueux des dents et des gencives du chien, propriétés de vol parfaites, idéales pour les jeux de lancer/rapporter")
reward8photo = URI.open("https://media.os.fressnapf.com/products-v2/f/4/2/7/f42756b24aa1aa59c6fb5b5a8aa5acc4e74609c1_59d4560610a516fc8d7f2361319050d2c2a26d2e.jpg")
reward8.photo.attach(io: reward8photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward8.name}"


reward9 = Reward.create!(price: 11.99, name: "Disque à lancer", reduction: 15, promocode: "MAXIZOO15", link: "https://www.maxizoo.fr/p/dogs-creek-disque--lancer-easy-fly-1246733/", money: 64, description: "Idéal pour les séances de lancer et rapporter en plein air, matériau bon pour les dents, flottante")
reward9photo = URI.open("https://media.os.fressnapf.com/products-v2/8/8/1/e/881e54e0fd97b87f9d2c83541752e90dd9b69129_4c91a05743fd3322b1a0a2fadaf108d07ed5811e.jpg")
reward9.photo.attach(io: reward9photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward9.name}"


reward10 = Reward.create!(price: 13.29, name: "Friends Balistic Assorted", reduction: 15, promocode: "MAXIZOO15", link: "https://www.maxizoo.fr/p/kong-jouet-wubba-friends-balistic-assorted-l-1214892/", money: 76, description: "Tissu et coutures renforcés pour un un plaisir de jouer qui dure, idéal pour les séances de lancer et rapporter, couine pour plus de plaisir")
reward10photo = URI.open("https://media.os.fressnapf.com/products-v2/b/2/9/4/b2943f487836293d4b55c99bfd633a793f6a40fc_e4788f732c9fc3dece2620f1e49add87a135522d.jpg")
reward10.photo.attach(io: reward10photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward10.name}"


reward11 = Reward.create!(price: 12.59, name: "Jouet balle de rugby", reduction: 15, promocode: "MAXIZOO15", link: "https://www.maxizoo.fr/p/dogs-creek-jouet-balle-de-rugby-1295874/", money: 85, description: "Bon pour les dents, idéale pour les séances de lancer et rapporter, flottante")
reward11photo = URI.open("https://media.os.fressnapf.com/products-v2/1/1/5/c/115c03352d743c39aab5f7a6ddff9efb7953cce2_b9e1f6ef0fbf6d79edb735369886432eef8069dd.jpg")
reward11.photo.attach(io: reward11photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward11.name}"


reward12 = Reward.create!(price: 10.79, name: "Boomerang Hyper", reduction: 10, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/dogs-creek-boomerang-hyper-1337242/", money: 63, description: "Jouet interactif, flottante, lavable")
reward12photo = URI.open("https://media.os.fressnapf.com/products-v2/7/a/7/c/7a7cb11b05851a7f2c7d0c9585f1bdaa809bf4eb_1337242__de_DE__DCboomerang__1_.PNG")
reward12.photo.attach(io: reward12photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward12.name}"


reward13 = Reward.create!(price: 57.29, name: "Fontaine à eau", reduction: 15, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/savic-fontaine--eau-cascade-1184549/", money: 112, description: "3 zones d’abreuvement, le filtre au charbon actif garantit de l’eau toujours fraîche, facile à entretenir et à nettoyer")
reward13photo = URI.open("https://media.os.fressnapf.com/products-v2/1/f/b/a/1fba5244cb8168b0c9d504c0efb01f0c80af0e22_a1a3772e2de4b7e622ac121ab508d5c16feebba5.jpg")
reward13.photo.attach(io: reward13photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward13.name}"


reward14 = Reward.create!(price: 59.99, name: "Fontaine à eau 1,8 l", reduction: 15, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/petsafe-fontaine--eau-18-l-1323706/", money: 142, description: "Contrôle du débit d’eau réglable, circulation de l’eau presque silencieuse, facile à nettoyer")
reward14photo = URI.open("https://media.os.fressnapf.com/products-v2/7/e/2/0/7e2004406afd321261645f2beb5f6cb876761418_1323706__1_.jpg")
reward14.photo.attach(io: reward14photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward14.name}"


reward15 = Reward.create!(price: 32.99, name: "Set de gamelles", reduction: 10, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/trixie-set-de-gamelles-cramiquebois-2x400-ml-1232672/", money: 136, description: "Gamelle lourde en bois dur, laqué, robuste, antidérapant grâce aux pieds en caoutchouc, mangeoires lavables au lave-vaisselle")
reward15photo = URI.open("https://media.os.fressnapf.com/products-v2/e/f/1/5/ef152e872c9b8550029549a1ccb33ec8a5b1d999_6bcf2eee710bf86351113f0252df8e708fa6c015.jpg")
reward15.photo.attach(io: reward15photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward15.name}"


reward16 = Reward.create!(price: 23.99, name: "Filets de poulet", reduction: 10, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/multifit-native-filets-de-poulet-1-kg-1211881/", money: 115, description: "Dès le plus jeune  âge, peut contribuer à l’hygiène dentaire, friandise sans additifs artificiels")
reward16photo = URI.open("https://media.os.fressnapf.com/products-v2/8/1/d/0/81d0215a59c85aeddde7b87ff724d6464067cb15_a580f557b9e9ac073c8f7ff50d9a6107ae8dae8a.png")
reward16.photo.attach(io: reward16photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward16.name}"


reward17 = Reward.create!(price: 19.93, name: "Meat Jerkys Bœuf", reduction: 10, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/premiere-meat-jerkys-6-x-70-g-buf-1212565/", money: 140, description: "94 % de viande pure, séchée à l’air, développé par des vétérinaires, sans colorants ni conservateurs")
reward17photo = URI.open("https://media.os.fressnapf.com/products-v2/8/1/d/0/81d0215a59c85aeddde7b87ff724d6464067cb15_a580f557b9e9ac073c8f7ff50d9a6107ae8dae8a.png")
reward17.photo.attach(io: reward17photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward17.name}"


reward18 = Reward.create!(price: 5.49, name: "Tendons de bœuf", reduction: 10, promocode: "MAXIZOO10", link: "https://www.maxizoo.fr/p/mimos-tendons-de-buf-env-15cm-120g-1396854/", money: 113, description: "Plaisir de mastication prolongé, sans céréales, renforce les muscles de la mastication")
reward18photo = URI.open("https://media.os.fressnapf.com/products-v2/5/e/f/2/5ef2286607b3e043738c4a2e44c5333f9be66cc2_1396854_0.png")
reward18.photo.attach(io: reward18photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward18.name}"


reward19 = Reward.create!(price: 19.99, name: "Longe plate 15m", reduction: 35, promocode: "MAXIZOO35", link: "https://www.maxizoo.fr/p/anione-longe-plate-avec-passant-bleu-15-m-1273409", money: 105, description: "Longe munie d'une dragonne, ne convient pas aux chiens de plus de 30 kg, disponible en plusieurs coloris et tailles")
reward19photo = URI.open("https://media.os.fressnapf.com/products-v2/3/9/0/6/390633ae239d18f80627ec026d353456d91753f9_d7383239ee65a9727afced5981424efe35afad23.jpg")
reward19.photo.attach(io: reward19photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward19.name}"


reward20 = Reward.create!(price: 20.99, name: "Laisse Classic 5 m", reduction: 60, promocode: "MAXIZOO60", link: "https://www.maxizoo.fr/p/flexi-laisse-new-classic-bleu-l-5-m-50-kg-1267779/", money: 160, description: "Touche de freinage confortable, crochet chromé, fabriqué en Allemagne")
reward20photo = URI.open("https://media.os.fressnapf.com/products-v2/f/c/d/e/fcde4ad994a8cd929d172f5dfe44aaf7859807d5_1267779__2_.jpg")
reward20.photo.attach(io: reward20photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward20.name}"


reward21 = Reward.create!(price: 48.72, name: "Coussin Ortho", reduction: 60, promocode: "MAXIZOO60", link: "https://www.maxizoo.fr/p/more-coussin-ortho-ovale-m-1323498", money: 157, description: "Se coucher, se reposer et dormir en préservant les articulations, lavable à 30 °C, fonction antidérapante")
reward21photo = URI.open("https://media.os.fressnapf.com/products-v2/4/5/b/7/45b79fca03b4e5ace32adcbbe1e565f31dcb402b_af133180638e87fe7624b4fa85879bb24a26e049.jpg")
reward21.photo.attach(io: reward21photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward21.name}"


reward22 = Reward.create!(price: 29.99, name: "Couchette Luna", reduction: 20, promocode: "MAXIZOO20", link: "https://www.maxizoo.fr/p/anione-couchette-luna-1325544/", money: 185, description: "Peluche douillette, dessous antidérapant, housse réversible retirable avec housse de coussin retirable")
reward22photo = URI.open("https://media.os.fressnapf.com/products-v2/1/4/1/d/141d5a1630e28452183b11ecaf001cc054408ed6_8f453aa86e0daac0ddeab105c88f08260a6b5e3c.png")
reward22.photo.attach(io: reward22photo, filename: "kong2.jpg", content_type: "image/jpg")
puts "reward : #{reward22.name}"

puts "REWARDS DONE !"

course1 = Course.new(distance: 1400, money: 25, water: false, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 20, name: "Parc Bordelais", description: "Charmant petit parc urbain, parfait pour une promenade relaxante avec son chien.")
course1photo1 = URI.open("https://www.tourisme-gironde.fr/wp-content/uploads/2022/09/800px-XDSC_7599-jardin-public-de-Bordeaux.jpg")
course1photo2 = URI.open("https://www.visiter-bordeaux.eu/wp-content/uploads/2019/05/Parc_Bordelais_Bordeaux_France_-_panoramio_2.jpg")
course1photo3 = URI.open("https://www.bordeaux-tourisme.com/sites/bordeaux_tourisme/files/medias/widgets/misc/Parc%20bordelais%C2%A9Bordeaux%20M%C3%A9tropole.jpg")
course1photo4 = URI.open("https://d3ccb8ca.rocketcdn.me/wp-content/uploads/2023/09/AdobeStock_423700889-2.jpg")
course1photo5 = URI.open("https://bordeaux-et-vous.com/cms/wp-content/uploads/2015/07/parc-bordelais-allee.jpg")
course1.photos.attach(io: course1photo1, filename: "photo.jpg", content_type: "image/jpg")
course1.photos.attach(io: course1photo2, filename: "photo2.jpg", content_type: "image/jpg")
course1.photos.attach(io: course1photo3, filename: "photo3.jpg", content_type: "image/jpg")
course1.photos.attach(io: course1photo4, filename: "photo3.jpg", content_type: "image/jpg")
course1.photos.attach(io: course1photo5, filename: "photo3.jpg", content_type: "image/jpg")
course1.latitude = "44.85130481877134"
course1.longitude = "-0.6043516086192207"
course1.route = [[-0.6043516086192207, 44.85130481877134],
                  [-0.6031470207682628, 44.85108835746624],
                  [-0.6022062521308926, 44.85120188085345],
                  [-0.6016057615112946, 44.85140054624258],
                  [-0.60098525453771, 44.851797874965065],
                  [-0.600384763918112, 44.85229453201344],
                  [-0.5999043714224336, 44.85283375481659],
                  [-0.5996041261126346, 44.85344392189972],
                  [-0.5996041261126346, 44.854295307026014],
                  [-0.6001758812699322, 44.854729634878254],
                  [-0.6009785272307998, 44.85510896268933],
                  [-0.60204872184529, 44.85531126983354],
                  [-0.6028870409599739, 44.855248048927336],
                  [-0.6034221382672189, 44.85504574156099],
                  [-0.6041177647666376, 44.85457790305422],
                  [-0.604474496304801, 44.85412270518334],
                  [-0.6045280060355255, 44.853389323267685],
                  [-0.6045458426124336, 44.85279502417518],
                  [-0.6047242083815153, 44.85225129835672],
                  [-0.6047598815353317, 44.85172021236907],
                  [-0.6043139671126273, 44.85131557213896]]
course1.save!
puts "course : #{course1.name} done !"

course2 = Course.new(distance: 1300, money: 30, water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 20, name: "Jardin Public", description: "Créé en 1746, le jardin public est un espace vert de 10,8 hectares situé en plein centre ville et abritant de multiples activités familiales.")
course2photo1 = URI.open("https://a.travel-assets.com/findyours-php/viewfinder/images/res70/132000/132861-Jardin-Public.jpg")
course2photo2 = URI.open("https://www.bordeaux.fr/images/ebx/fr/lieu/858/format6/TS170367_1.jpg")
course2photo3 = URI.open("https://www.bordeaux.fr/images/ebx/fr/lieu/858/format6/TS170348_6.jpg")
course2photo4 = URI.open("https://www.gironde-tourisme.com/wp-content/uploads/wpetourisme/Jardin-Public-2.jpg")
course2photo5 = URI.open("https://www.parcsetjardins.fr/data/cache/GardenPicture/picture/main/a/0/4386.1606316749.jpg")
course2photo6 = URI.open("https://www.francebleu.fr/s3/cruiser-production/2017/09/22a92516-09ed-467f-bb55-35c8b9b56133/1200x680_jardin_0.jpg")
course2.photos.attach(io: course2photo1, filename: "photo1.jpg", content_type: "image/jpg")
course2.photos.attach(io: course2photo2, filename: "photo2.jpg", content_type: "image/jpg")
course2.photos.attach(io: course2photo3, filename: "photo3.jpg", content_type: "image/jpg")
course2.photos.attach(io: course2photo4, filename: "photo3.jpg", content_type: "image/jpg")
course2.photos.attach(io: course2photo5, filename: "photo3.jpg", content_type: "image/jpg")
course2.photos.attach(io: course2photo6, filename: "photo3.jpg", content_type: "image/jpg")
course2.latitude = "44.849334047727275"
course2.longitude = "-0.5759842937562886"
course2.route = [[-0.5759842937562886, 44.849334047727275],
                [-0.5760379378795729, 44.8489385158657],
                [-0.5762417857738129, 44.84858481679192],
                [-0.5764617268992027, 44.848234918813624],
                [-0.5766977612776697, 44.84795728086193],
                [-0.5770088975038308, 44.84764921526707],
                [-0.5771161858576794, 44.84810180489417],
                [-0.5773253981476844, 44.84842508102202],
                [-0.5776150767030757, 44.8486684877327],
                [-0.5779315774015806, 44.84904120226425],
                [-0.5782212559569719, 44.84862665227675],
                [-0.5788327995739092, 44.84829196754132],
                [-0.5792351309008417, 44.84861524260188],
                [-0.579696470925621, 44.84895372867456],
                [-0.5802972857756562, 44.849132478948086],
                [-0.5808337275448994, 44.84959646640335],
                [-0.5815257374272231, 44.84995015924797],
                [-0.5807854477856674, 44.85018215014932],
                [-0.5799378697902633, 44.85036089659993],
                [-0.57895618128609, 44.850398927693],
                [-0.5782802646568436, 44.85018595327603],
                [-0.5775507038506728, 44.849972978071534],
                [-0.5771108214716993, 44.849839868163144],
                [-0.5765851085378411, 44.849672529563286],
                [-0.5759842937562886, 44.849334047727275]]
course2.save!
puts "course : #{course2.name} done !"

course3 = Course.new(distance: 900, water: true, money: 50, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 15, name: "Parc Rivière", description: "Parfait pour des petites balades relaxantes, ce parc est un véritable havre de paix pour les amoureux des animaux et de la nature.")
course3photo1 = URI.open("https://www.bordeaux.fr/images/ebx/fr/lieu/862/format6/parc_riviere_1_3.jpg")
course3photo2 = URI.open("https://media.sudouest.fr/4206561/1200x600/parc-riviere-une-2.jpg")
course3photo3 = URI.open("https://lh3.googleusercontent.com/p/AF1QipOqgD4XM5BeILwU4AwvIeN9smKvtJNV4pSGJhF4=s1600-w640")
course3.photos.attach(io: course3photo1, filename: "photo.jpg", content_type: "image/jpg")
course3.photos.attach(io: course3photo2, filename: "photo2.jpg", content_type: "image/jpg")
course3.photos.attach(io: course3photo3, filename: "photo3.jpg", content_type: "image/jpg")
course3.latitude = "44.855411406310346"
course3.longitude = "-0.5885728306130503"
course3.route = [[-0.5885728306130503, 44.855411406310346],
                  [-0.5885425642727812, 44.854456629734244],
                  [-0.5867719833670346, 44.85442444597837],
                  [-0.5867417170267655, 44.85422061510676],
                  [-0.5861666565616512, 44.85424207102195],
                  [-0.5855613297562678, 44.8544995413808],
                  [-0.5855007970757296, 44.85580833123968],
                  [-0.5850165356314228, 44.85599070123585],
                  [-0.5852737995237107, 44.85622670860885],
                  [-0.5866206516656889, 44.85595851833734],
                  [-0.5865601189851505, 44.85579760357486],
                  [-0.5879977701479361, 44.85565814375035],
                  [-0.5879826369778015, 44.8555079558693],
                  [-0.5885879637831849, 44.85549722814853]]
course3.save!
puts "course : #{course3.name} done !"

course4 = Course.new(distance: 3600, money:20, water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 25, name: "Parc de l'Hermitage", description: "Charmant petit parc urbain, parfait pour une promenade relaxante avec son chien.")
course4photo1 = URI.open("https://bordeaux-et-vous.com/preprod/wp-content/uploads/2015/07/Parc-Ermitage-Vue-Lormont-1024x580.jpg")
course4photo2 = URI.open("https://www.lormont.fr/fileadmin/images/04.decouvrir/Nature_et_patrimoines/musee/avl/parc-de-lermitage__3_.JPG")
course4photo3 = URI.open("https://media.sudouest.fr/4561977/1000x625/so-57e10cc466a4bde778cf5f63-ph0.jpg")
course4.photos.attach(io: course4photo1, filename: "photo.jpg", content_type: "image/jpg")
course4.photos.attach(io: course4photo2, filename: "photo2.jpg", content_type: "image/jpg")
course4.photos.attach(io: course4photo3, filename: "photo3.jpg", content_type: "image/jpg")
course4.latitude = "44.86399566698517"
course4.longitude = "-0.5956244975178163"
course4.route = [[-0.5956244975178163, 44.86399566698517],
                  [-0.5956117608005242, 44.86506091062664],
                  [-0.5950003983705027, 44.86506091062664],
                  [-0.5948985046321658, 44.86518729415738],
                  [-0.5952933428682212, 44.86598169856868],
                  [-0.5939177774006726, 44.86598169856868],
                  [-0.5940069344217175, 44.86738090695093],
                  [-0.5933700985571116, 44.86742604213892],
                  [-0.5931790477977299, 44.86789544599616],
                  [-0.5941597750292229, 44.86794058078072],
                  [-0.5950640819569631, 44.86797668858286],
                  [-0.5950640819569631, 44.867868365108464],
                  [-0.5954461834757268, 44.86785933814305],
                  [-0.5954334467584347, 44.86720939291376],
                  [-0.5960830193403325, 44.86702885126987],
                  [-0.5952423959990529, 44.866144189029534],
                  [-0.5970892200064097, 44.86584628950092],
                  [-0.597216587179331, 44.86544006038651],
                  [-0.596874279873727, 44.86531986769776],
                  [-0.5971799610887378, 44.86479627818407],
                  [-0.5969507001774796, 44.864660866327895],
                  [-0.5967596494180979, 44.86439004165994],
                  [-0.5957789221866049, 44.86406505037658]]
course4.save!
puts "course : #{course4.name} done !"

course5 = Course.new(distance: 2800, money: 33, water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 25, name: "Parc du Bourran", description: "Charmant petit parc urbain, parfait pour une promenade relaxante avec son chien.")
course5photo2 = URI.open("https://www.merignac.com/sites/default/files/2022-01/parc-bourran.jpg")
course5photo1 = URI.open("https://www.aixenprovencetourism.com/wp-content/uploads/2013/12/Parc-Rambot-credit-P.-Biolatto-ville-dAix-en-Pce-5-1920x1080.jpg")
course5photo3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/5/5d/Ch%C3%A2teau_Bourran_sous_la_pluie_Merignac_33.jpg")
course5.photos.attach(io: course5photo1, filename: "photo.jpg", content_type: "image/jpg")
course5.photos.attach(io: course5photo2, filename: "photo2.jpg", content_type: "image/jpg")
course5.photos.attach(io: course5photo3, filename: "photo3.jpg", content_type: "image/jpg")
course5.latitude = "44.83805750254676"
course5.longitude = "-0.6303296870228531"
course5.route = [[-0.5956244975178163, 44.86399566698517],
                  [-0.5956117608005242, 44.86506091062664],
                  [-0.5950003983705027, 44.86506091062664],
                  [-0.5948985046321658, 44.86518729415738],
                  [-0.5952933428682212, 44.86598169856868],
                  [-0.5939177774006726, 44.86598169856868],
                  [-0.5940069344217175, 44.86738090695093],
                  [-0.5933700985571116, 44.86742604213892],
                  [-0.5931790477977299, 44.86789544599616],
                  [-0.5941597750292229, 44.86794058078072],
                  [-0.5950640819569631, 44.86797668858286],
                  [-0.5950640819569631, 44.867868365108464],
                  [-0.5954461834757268, 44.86785933814305],
                  [-0.5954334467584347, 44.86720939291376],
                  [-0.5960830193403325, 44.86702885126987],
                  [-0.5952423959990529, 44.866144189029534],
                  [-0.5970892200064097, 44.86584628950092],
                  [-0.597216587179331, 44.86544006038651],
                  [-0.596874279873727, 44.86531986769776],
                  [-0.5971799610887378, 44.86479627818407],
                  [-0.5969507001774796, 44.864660866327895],
                  [-0.5967596494180979, 44.86439004165994],
                  [-0.5957789221866049, 44.86406505037658]]
course5.save!
puts "course : #{course5.name} done !"


course6 = Course.new(distance: 1500, money: 12, water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 25, name: "Bois de Thouars", description: "Charmant petit parc urbain, parfait pour une promenade relaxante avec son chien.")
course6photo2 = URI.open("https://www.guide-bordeaux-gironde.com/_bibli/annonces/5362/hd/bois-de-thouars.jpg")
course6photo3 = URI.open("https://www.bougerabordeaux.com/wp-content/uploads/2024/01/BOIS-DE-THOUARS-1024x512.jpg")
course6photo1 = URI.open("https://www.u-bordeaux.fr/application/files/cache/thumbnails/ec767a15dd9c56abc7d27447882a9595.jpg")
course6.photos.attach(io: course6photo1, filename: "photo.jpg", content_type: "image/jpg")
course6.photos.attach(io: course6photo2, filename: "photo2.jpg", content_type: "image/jpg")
course6.photos.attach(io: course6photo3, filename: "photo3.jpg", content_type: "image/jpg")
course6.latitude = "44.788535847652575"
course6.longitude = "-0.5948100136221868"
course6.route = [[-0.5956244975178163, 44.86399566698517],
                  [-0.5956117608005242, 44.86506091062664],
                  [-0.5950003983705027, 44.86506091062664],
                  [-0.5948985046321658, 44.86518729415738],
                  [-0.5952933428682212, 44.86598169856868],
                  [-0.5939177774006726, 44.86598169856868],
                  [-0.5940069344217175, 44.86738090695093],
                  [-0.5933700985571116, 44.86742604213892],
                  [-0.5931790477977299, 44.86789544599616],
                  [-0.5941597750292229, 44.86794058078072],
                  [-0.5950640819569631, 44.86797668858286],
                  [-0.5950640819569631, 44.867868365108464],
                  [-0.5954461834757268, 44.86785933814305],
                  [-0.5954334467584347, 44.86720939291376],
                  [-0.5960830193403325, 44.86702885126987],
                  [-0.5952423959990529, 44.866144189029534],
                  [-0.5970892200064097, 44.86584628950092],
                  [-0.597216587179331, 44.86544006038651],
                  [-0.596874279873727, 44.86531986769776],
                  [-0.5971799610887378, 44.86479627818407],
                  [-0.5969507001774796, 44.864660866327895],
                  [-0.5967596494180979, 44.86439004165994],
                  [-0.5957789221866049, 44.86406505037658]]
course6.save!
puts "course : #{course6.name} done !"

course7 = Course.new(distance: 1500, water: true, money: 50, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 15, name: "Parc de Mussonville", description: "Parfait pour des petites balades relaxantes, ce parc est un véritable havre de paix pour les amoureux des animaux et de la nature.")
course7photo2 = URI.open("https://farm6.staticflickr.com/5566/14874322260_853f35eded_b.jpg")
course7photo1 = URI.open("https://www.gironde-tourisme.com/wp-content/uploads/wpetourisme/2016-begles-balades-099-scaled.jpg")
course7photo3 = URI.open("https://images.lesindesradios.fr/fit-in/1100x2000/filters:format(webp)/radios/witfm/importrk/news/original/5e4bde07c07737.93063564.jpg")
course7.photos.attach(io: course7photo1, filename: "photo.jpg", content_type: "image/jpg")
course7.photos.attach(io: course7photo2, filename: "photo2.jpg", content_type: "image/jpg")
course7.photos.attach(io: course7photo3, filename: "photo3.jpg", content_type: "image/jpg")
course7.latitude = "44.79156130055252"
course7.longitude = "-0.5581650431814745"
course7.route = [[-0.5594754117586499, 44.7933904805303],
                 [-0.5592695062120994, 44.79329497254417],
                 [-0.559443849790197, 44.79316363516128],
                 [-0.5596691553456786, 44.79299518025285],
                 [-0.5599172596765493, 44.792726793449546],
                 [-0.5597040240648624, 44.79259688236851],
                 [-0.5594170276997388, 44.7924388948721],
                 [-0.5591581945256019, 44.79229327950654],
                 [-0.5589925681204356, 44.79219762999786],
                 [-0.558809507367241, 44.79212101510471],
                 [-0.5590093319267342, 44.79193828103164],
                 [-0.5592846243120957, 44.79171433725874],
                 [-0.5593966065487258, 44.79163105949492],
                 [-0.5595219998161037, 44.791479731599615],
                 [-0.5595897255980186, 44.79138741186801],
                 [-0.5596460519836169, 44.79119468206336],
                 [-0.5594824372353451, 44.790989578769555],
                 [-0.5593711255583971, 44.79086775372862],
                 [-0.5591203390245695, 44.79064218637835],
                 [-0.5588776869962486, 44.79043069424673],
                 [-0.5587301654987498, 44.79032171689994],
                 [-0.5585511280468727, 44.79023843712921],
                 [-0.5584270758744511, 44.79021844996553],
                 [-0.558345939057101, 44.79018513801257],
                 [-0.5582178635850857, 44.79011185164842],
                 [-0.5577826751790969, 44.79035502877295],
                 [-0.5574514223489113, 44.790533960800666],
                 [-0.5570705486734391, 44.79079759899988],
                 [-0.5567775173430729, 44.791026972770766],
                 [-0.5567305786884077, 44.79105742896998],
                 [-0.5566668762151512, 44.79103839384992],
                 [-0.5565555645483736, 44.79105457370457],
                 [-0.5563503755570542, 44.79114974922999],
                 [-0.5560747785820124, 44.791287753462456],
                 [-0.5558917178164369, 44.79141814336553],
                 [-0.555811251543735, 44.79148619345475],
                 [-0.5557435257610244, 44.79170366767339],
                 [-0.5556047214456533, 44.79185642259719],
                 [-0.5554424477947697, 44.7920196462604],
                 [-0.5552238477624881, 44.79225377385578],
                 [-0.5550743146097314, 44.792405099723354],
                 [-0.5550045771796777, 44.79248076250872],
                 [-0.5554002030018567, 44.792679674263084],
                 [-0.5559104932682662, 44.79295757853185],
                 [-0.5564100546891532, 44.79323786076266],
                 [-0.5569660111397238, 44.793565834129105],
                 [-0.5572067393901875, 44.79378044537747],
                 [-0.5571363314018223, 44.79388608521356],
                 [-0.5571162148355372, 44.7939508014115],
                 [-0.5571443780282036, 44.794038358506725],
                 [-0.5575703500484219, 44.794618819804334],
                 [-0.5577734707317596, 44.79487599335947],
                 [-0.5578908173742154, 44.794920247067836],
                 [-0.5582066474990729, 44.79498781718117],
                 [-0.5582381634529197, 44.794951652905866],
                 [-0.5585761217806149, 44.79483364300654],
                 [-0.558641835908113, 44.7947927201599],
                 [-0.5589968602199601, 44.79403357608153],
                 [-0.5590350817008983, 44.793986942422926],
                 [-0.559077997044031, 44.79390319208695],
                 [-0.5590793381502632, 44.79390271623188],
                 [-0.5590759853844403, 44.79380992452234],
                 [-0.5590431283261745, 44.793720463658225],
                 [-0.5590545277156816, 44.793596265097996],
                 [-0.5592067430721475, 44.79336023951426],
                 [-0.5594769756125776, 44.793399735797706]]
course7.save!
puts "course : #{course7.name} done !"

course8 = Course.new(distance: 1255, water: true, money: 50, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 15, name: "Parc Palmer", description: "Parfait pour des petites balades relaxantes, ce parc est un véritable havre de paix pour les amoureux des animaux et de la nature.")
course8photo3 = URI.open("https://www.labelleendormie.com/wp-content/uploads/2017/04/75491180620092135-555x531.jpg")
course8photo2 = URI.open("https://www.labelleendormie.com/wp-content/uploads/2017/04/Com_sc-Vues_Palmer-2011__44__800.jpg")
course8photo1 = URI.open("https://www.label-ecojardin.fr/sites/default/files/styles/max_2600x2600/public/labellisation/sites/2021/photos/Parc_Palmer_Cenon%C2%A9Oreade-Breche_2021%20%2814%29.jpg?itok=Nq69eHoN")
course8.photos.attach(io: course8photo1, filename: "photo.jpg", content_type: "image/jpg")
course8.photos.attach(io: course8photo2, filename: "photo2.jpg", content_type: "image/jpg")
course8.photos.attach(io: course8photo3, filename: "photo3.jpg", content_type: "image/jpg")
course8.latitude = "44.862770247811"
course8.longitude = "-0.5248191562247543"
course8.route = [[-0.5248191562247543, 44.862770247811],
                 [-0.5256981086620284, 44.862984867541606],
                 [-0.5270123307427198, 44.863219496779884],
                 [-0.5281412771708188, 44.863315799548324],
                 [-0.5287415703258614, 44.86314070348537],
                 [-0.5284895954212757, 44.862673194388066],
                 [-0.5278003699813405, 44.862408796175565],
                 [-0.5270839707418348, 44.86205684699975],
                 [-0.526308283277919, 44.86182221301985],
                 [-0.5261995882001875, 44.861281150417454],
                 [-0.5267356524904009, 44.860957210828545],
                 [-0.5274125262823707, 44.86082413241393],
                 [-0.5276867342905562, 44.8601622378393],
                 [-0.5279140057859935, 44.859547614635495],
                 [-0.5280721077074358, 44.859036299160266],
                 [-0.5283537267329413, 44.858265815222644],
                 [-0.5286995746625369, 44.85777199963663],
                 [-0.529403622213351, 44.857810524404435],
                 [-0.5295098469402469, 44.85719237380712],
                 [-0.5294629104331998, 44.856411358188915],
                 [-0.5291294142126589, 44.85592278024906],
                 [-0.528299379232847, 44.85594379443892],
                 [-0.5279164761915646, 44.85640785584365],
                 [-0.5276645012431574, 44.85687541582215],
                 [-0.5274594628404062, 44.85717661349438],
                 [-0.5265849616465514, 44.8572589172392],
                 [-0.5258142148367392, 44.85760214008671],
                 [-0.5264046266322601, 44.857990890029605],
                 [-0.5270160968443558, 44.85821430425535],
                 [-0.5268999907444171, 44.8589847888805],
                 [-0.5264874435574527, 44.859667709819036],
                 [-0.5261984134756933, 44.860438175006976],
                 [-0.5257982180070696, 44.86094422493883],
                 [-0.5256722305362056, 44.861336454354095],
                 [-0.5254128445761808, 44.86193179746286],
                 [-0.5250126491034839, 44.862464099031534],
                 [-0.5248594878869709, 44.862768769418885]]
course8.save!
puts "course : #{course8.name} done !"

course9 = Course.new(distance: 1255, water: true, money: 60, trashs: true, poopbag: true, familyfriendly: true, difficulty: 1, timing: 34, name: "Jardin Public 2", description: "Parfait pour des petites balades relaxantes, ce parc est un véritable havre de paix pour les amoureux des animaux et de la nature.")
course9photo1 = URI.open("https://a.travel-assets.com/findyours-php/viewfinder/images/res70/132000/132861-Jardin-Public.jpg")
course9photo2 = URI.open("https://www.bordeaux.fr/images/ebx/fr/lieu/858/format6/TS170367_1.jpg")
course9photo3 = URI.open("https://www.bordeaux.fr/images/ebx/fr/lieu/858/format6/TS170348_6.jpg")
course9photo4 = URI.open("https://www.gironde-tourisme.com/wp-content/uploads/wpetourisme/Jardin-Public-2.jpg")
course9photo5 = URI.open("https://www.parcsetjardins.fr/data/cache/GardenPicture/picture/main/a/0/4386.1606316749.jpg")
course9photo6 = URI.open("https://www.francebleu.fr/s3/cruiser-production/2017/09/22a92516-09ed-467f-bb55-35c8b9b56133/1200x680_jardin_0.jpg")
course9.photos.attach(io: course9photo1, filename: "photo1.jpg", content_type: "image/jpg")
course9.photos.attach(io: course9photo2, filename: "photo2.jpg", content_type: "image/jpg")
course9.photos.attach(io: course9photo3, filename: "photo3.jpg", content_type: "image/jpg")
course9.photos.attach(io: course9photo4, filename: "photo3.jpg", content_type: "image/jpg")
course9.photos.attach(io: course9photo5, filename: "photo3.jpg", content_type: "image/jpg")
course9.photos.attach(io: course9photo6, filename: "photo3.jpg", content_type: "image/jpg")
course9.latitude = "44.855411406310346"
course9.longitude = "-0.5885728306130503"
course9.route = [[-0.5759682787361504, 44.849314639333315],
                 [-0.5761379284513896, 44.84947056947183],
                 [-0.5765449536894295, 44.84964408879528],
                 [-0.5767709298039304, 44.84973061056361],
                 [-0.577125651946149, 44.84984280343068],
                 [-0.5772959722212038, 44.84972823359414],
                 [-0.5775306655093432, 44.84967784180922],
                 [-0.5778900815156574, 44.8498133290549],
                 [-0.5779826177275997, 44.849940258921855],
                 [-0.5780704600741197, 44.850071942421465],
                 [-0.5784674270020443, 44.85026114779023],
                 [-0.5786920620053164, 44.850330079239974],
                 [-0.5788865221583652, 44.850377142733926],
                 [-0.5791084749551428, 44.850429435459716],
                 [-0.5794900191870677, 44.85046651572859],
                 [-0.5797347707617106, 44.85041564920143],
                 [-0.5796670449891259, 44.85030821134262],
                 [-0.5795906020260996, 44.850194117822824],
                 [-0.5799473358142462, 44.85014420183583],
                 [-0.5800982100896844, 44.85011757995734],
                 [-0.580205498448379, 44.8500709916426],
                 [-0.5803080929428, 44.850009190758826],
                 [-0.5804750604549054, 44.84988273643606],
                 [-0.580569608323963, 44.8498057227649],
                 [-0.5807178003678792, 44.84976864207181],
                 [-0.5808579457873151, 44.84974487238423],
                 [-0.5807573629496984, 44.849686398912056],
                 [-0.5806433690714295, 44.84960843418984],
                 [-0.5805722905303677, 44.849539977273125],
                 [-0.5804334862108849, 44.84939640764072],
                 [-0.5803610665684117, 44.84933032745796],
                 [-0.5802943298735576, 44.84927253746026],
                 [-0.5801344702876083, 44.84918504141586],
                 [-0.5800419340803977, 44.84914510793008],
                 [-0.5799339751688751, 44.84910612521552],
                 [-0.5797676782127383, 44.84912799357047],
                 [-0.5797287861816238, 44.84917363185036],
                 [-0.5797006229856412, 44.84925159716112],
                 [-0.5795832763245251, 44.8492587281295],
                 [-0.5793888161752351, 44.849379003662854],
                 [-0.5793881456230255, 44.84938233144081],
                 [-0.5793056676944471, 44.849532081251915],
                 [-0.5791983793218689, 44.84969228934965],
                 [-0.578984473167037, 44.84965425779494],
                 [-0.5788309167110607, 44.84961480003038],
                 [-0.5786297510339714, 44.84962430792846],
                 [-0.5784902761654623, 44.849578670005926],
                 [-0.5783601890292135, 44.849523048738774],
                 [-0.5782723466799964, 44.849473132170715],
                 [-0.5781938920730758, 44.84942559254238],
                 [-0.5780483822322938, 44.84931862823383],
                 [-0.5780047963357576, 44.84926680989727],
                 [-0.5779752920331447, 44.849206434344815],
                 [-0.5779390822107362, 44.84914320633671],
                 [-0.5779310355885113, 44.84906714247716],
                 [-0.577858615943119, 44.84892262086516],
                 [-0.5778123478357995, 44.84886176955137],
                 [-0.5777580330992679, 44.848813754016234],
                 [-0.5777064005726363, 44.848752427184756],
                 [-0.5775642434996225, 44.84862644550683],
                 [-0.5774690250766313, 44.848527086176226],
                 [-0.5773724655488232, 44.84846005418691],
                 [-0.5770512710250394, 44.84836830105341],
                 [-0.5768775979934916, 44.84838351401779],
                 [-0.5766864906014013, 44.848383989422906],
                 [-0.5765020887361381, 44.84839825157356],
                 [-0.5762452672125266, 44.84857938057903],
                 [-0.576169494810155, 44.84871059178652],
                 [-0.5759938101181765, 44.84898157050991],
                 [-0.5759435186941507, 44.84908330605424],
                 [-0.5759267548868793, 44.849196926378106],
                 [-0.5759696702129442, 44.84930721869837]]
course9.save!
puts "course : #{course9.name} done !"

Review.create!(rating: 5, comment: "Magnifique promenade avec des paysages à couper le souffle !", user: user2, course: course1)
Review.create!(rating: 1, comment: "La promenade était décevante, le parc était mal entretenu.", user: user2, course: course3)
Review.create!(rating: 3, comment: "Balade agréable mais rien de spécial à voir.", user: user2, course: course2)
Review.create!(rating: 3, comment: "Pas mal pour une promenade rapide, mais pas pour une journée entière.", user: user2, course: course9)
Review.create!(rating: 5, comment: "Parc exceptionnel, parfait pour une promenade longue et agréable.", user: user2, course: course2)

Review.create!(rating: 5, comment: "Je recommande vivement cette application à tous les propriétaires de chiens qui cherchent des balades fiables et agréables pour leurs compagnons à quatre pattes !", user: user3, course: course6)
Review.create!(rating: 5, comment: "Magnifique promenade avec des paysages à couper le souffle.", user: user3, course: course9)
Review.create!(rating: 4, comment: "Très belle promenade, bien entretenue et paisible.", user: user3, course: course1)
Review.create!(rating: 2, comment: "Balade correcte mais manque de points d'intérêt.", user: user3, course: course4)

Review.create!(rating: 5, comment: "Le parc est impeccable, idéal pour une journée en famille.", user: user5, course: course1)
Review.create!(rating: 4, comment: "Des chemins bien entretenus et des vues splendides, une balade parfaite.", user: user5, course: course2)
Review.create!(rating: 4, comment: "Ambiance calme et relaxante, parfait pour se détendre !", user: user5, course: course9)
Review.create!(rating: 4, comment: "Beaucoup de bancs et de points d'eau, très pratique avec mon chien !", user: user5, course: course6)
Review.create!(rating: 4, comment: "Superbe pour une marche tranquille, beaucoup de verdure.", user: user5, course: course8)
Review.create!(rating: 4, comment: "Parc très beau mais un peu trop fréquenté à mon goût. Sinon, très propre et bien aménagé.", user: user5, course: course3)

Review.create!(rating: 4, comment: "Belle promenade avec des chemins ombragés. Un peu de bruit à cause de la proximité de la route.", user: user6, course: course7)
Review.create!(rating: 4, comment: "Endroit paisible avec de jolis sentiers. Quelques zones pourraient être mieux entretenues.", user: user6, course: course6)
Review.create!(rating: 3, comment: "Balade correcte, mais manque de diversité dans les paysages. Peu de bancs disponibles.", user: user6, course: course5)

Review.create!(rating: 4, comment: "Belle promenade avec de beaux panoramas. Quelques portions des sentiers étaient un peu boueuses.", user: user7, course: course4)
Review.create!(rating: 4, comment: "Très agréable avec de beaux points de vue. Certains sentiers pourraient être mieux balisés.", user: user7, course: course8)
Review.create!(rating: 3, comment: "Parc convenable pour une courte balade, mais pas grand-chose d'extraordinaire à voir.", user: user7, course: course3)
Review.create!(rating: 3, comment: "Beau parc mais manque d'entretien par endroits. Les sentiers pourraient être mieux indiqués.", user: user7, course: course6)
Review.create!(rating: 4, comment: "Parc spacieux avec de belles zones ombragées, parfait pour une balade relaxante.", user: user7, course: course1)

Review.create!(rating: 3, comment: "Balade agréable mais sans plus, pas de vue spectaculaire.", user: user8, course: course4)
Review.create!(rating: 2, comment: "Beaucoup de potentiel, mais les infrastructures pour chien sont insuffisantes.", user: user8, course: course2)
Review.create!(rating: 2, comment: "Parc assez bruyant, difficile de se détendre.", user: user8, course: course9)
Review.create!(rating: 3, comment: "Les chemins sont bien entretenus, mais le parc est assez petit.", user: user8, course: course7)
Review.create!(rating: 3, comment: "Sympathique mais peut devenir ennuyeux après un certain temps.", user: user8, course: course3)
Review.create!(rating: 5, comment: "Balade extraordinaire, paysages magnifiques et parc très bien entretenu.", user: user8, course: course6)

puts "Reviews done!"
