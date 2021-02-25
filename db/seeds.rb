# SEEDING USERS
    # t.string "email", default: "", null: false
    # t.string "encrypted_password", default: "", null: false
    # t.string "reset_password_token"
    # t.string "first_name"
    # t.string "last_name"
    # t.text "bio"
    # t.boolean "owner", default: false

user_list = [
  [ "peter@home.com", "secret", "Peter", "Buchmacher", "Living on the sea since 1986", true ],
  [ "mary@mycompany.com", "secret", "Mary", "Dover", "Having travelled once around the world twice!", false ],
  [ "victoria@sailors.org", "secret", "Victoria", "Danielson", "Sailing is my life.", true ]
]

puts "Creating #{user_list.length} users..."
user_list.each do | email, password, first_name, last_name, bio, owner |
  User.create(
    email: email,
    password: password,
    first_name: first_name,
    last_name: last_name,
    bio: bio,
    owner: owner
  )
  User.last == "" ? (puts "Error!") : (puts "Added #{User.last.first_name} #{User.last.last_name}")
end
puts "Finished!"
puts

# SEEDING BOATS
    # t.bigint "user_id"
    # t.integer "price_per_day"
    # t.integer "year"
    # t.integer "passenger_capacity"
    # t.string "length"
    # t.string "port_location"
    # t.string "boat_type"
    # t.string "name"
    # t.string "boat_image"
    # t.text "description"

boat_list = [
  [  1,   230, 1999,   6,  "32.15 ft.", "Athens",     "Sailing boat",
    "Janneau 32.2",
    "https://images.unsplash.com/photo-1564878123164-6a9c9957fc69",
    "Beautiful sailing boat, ideal to explore Greek Islands" ],
  [  1,  1518, 1996,  12,  "49.21 ft.", "Mykonos",    "Yacht",
     "Riviera 48 Flybridge",
     "https://images.unsplash.com/photo-1605281317010-fe5ffe798166",
     "Great motorboat for speedy rides, skipper included" ],
  [  3,  1530, 2006,  10,  "39.15 ft.", "Athens",     "Catamaran",
    "Nautitec 40 Catamaran",
    "https://images.unsplash.com/photo-1587587914411-99b15314dc84",
    "Super luxurious and spacy cat for up to 10 people" ],
  [  1,  1730, 1994,  10,  "51.25 ft.", "Paros",      "Yacht",
    "Princess 470",
    "https://images.unsplash.com/photo-1531339751961-324b4c494be9",
    "Feel the speed with this great motorboat" ],
  [  3,  2263, 2020,  12,  "49.15 ft.", "Rhodos",     "Yacht",
    "Sealine C430 (2020)",
    "https://images.unsplash.com/photo-1583200771217-8b9112459344",
    "The perfect choice for an unforgettable experience, brand new!" ],
  [  1,   820, 1996,  11,  "32.15 ft.", "Santorini",  "Catamaran",
    "Lagoon 420",
    "https://images.unsplash.com/photo-1581272281570-61907217b302",
    "Sail in style with this beautiful catamaran" ],
  [  1,   765, 1999,  12,  "46.15 ft.", "Poros",      "Sailing boat",
    "Dromor Triton 48",
    "https://images.unsplash.com/photo-1519801584609-8ee5f072eddd",
    "Great Greek sailing boat brand for rent in marina of Poros" ],
  [  3,   408, 2004,  10,  "44.15 ft.", "Athens",     "Sailing boat",
    "Bavaria 44",
    "https://images.unsplash.com/photo-1561908860-971f1e27e89e",
    "Meet Athens by sea with your wonderful Bavaria sailing boat" ],
  [  1,  4209, 2008,  19,  "65.15 ft.", "Athens",     "Yacht",
    "Apreamare Riva 60",
    "https://images.unsplash.com/photo-1599257559270-eeccb1f266df",
    "Pure luxury for unforgettable moments" ],
  [  3,  6166, 1967,  49,  "82.15 ft.", "Mykonos",   "Sailing boat",
    "230 Custom Unique",
    "https://images.unsplash.com/photo-1568764461962-b649bb701242",
    "Custom made 2 mast sailing boat for 49 people" ]
]

puts "Creating #{boat_list.length} boats..."
boat_list.each do | user_id, price_per_day, year, passenger_capacity, length, port_location, boat_type, name, boat_image, description |
  Boat.create(
    user_id: user_id,
    price_per_day: price_per_day,
    year: year,
    passenger_capacity: passenger_capacity,
    length: length,
    port_location: port_location,
    boat_type: boat_type,
    name: name,
    boat_image: boat_image,
    description: description
  )
  Boat.last == "" ? (puts "Error!") : (puts "Added #{Boat.last.name}")
end
puts "Finished!"

