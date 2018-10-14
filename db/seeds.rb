# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# --------------------
# ------ OWNERS ------
# --------------------
nancy = Owner.create(first_name: "Nancy", last_name: "Do", picture_url: "https://miro.medium.com/fit/c/240/240/1*eB2VBCruYQsHvHp25d4BrA.jpeg", zip_code: "77377", email: "nancy@example.com", password: "password123")

john = Owner.create(first_name: "John", last_name: "Nguyen", zip_code: "77002", email: "john@example.com", password: "password123")

# --------------------
# ------ DOGS --------
# --------------------
nala = Dog.create(name: "Nala", age: "Adult", breed: "Dachshund", size: "S", sex: "Female", short_bio: "The baddest one of them all", picture_url: "https://cdn1.imggmi.com/uploads/2018/10/11/684211d9d6bf2982830428552cc0566d-full.png", owner: nancy)

leroy = Dog.create(name: "Leroy", age: "Adult", breed: "Australian Shepherd", size: "L", sex: "Male", short_bio: "Sweet boy", picture_url: "https://image.ibb.co/hVeF8p/leroy.jpg", owner: john)


# --------------------
# ------ MEETUPS -----
# --------------------
meetup1 = Meetup.create(date: "20181028", address: "25219 Kuykendahl Road #G110", zip_code: 77375, location_name: "Craft Grill", time: "5:00 PM")

meetup2 = Meetup.create(date: "20181128", address: "12345 street", zip_code: 77375, location_name: "Taco Truck", time: "6:00 PM")

meetup3 = Meetup.create(date: "20190128", address: "25219 street", zip_code: 77375, location_name: "Dog Bar", time: "7:00 PM")

meetup4 = Meetup.create(date: "20181220", address: "1235 doggie land", zip_code: 77375, location_name: "Willow Park", time: "7:00 AM")
# -------------------------------------
# ------ OWNER-MEETUP ASSOCIATION -----
# -------------------------------------
nancy_meetup1 = OwnerMeetup.create(owner: nancy, meetup: meetup1)

john_meetup2 = OwnerMeetup.create(owner: john, meetup: meetup2)

john_meetup3 = OwnerMeetup.create(owner: john, meetup: meetup3)

john_meetup4 = OwnerMeetup.create(owner: john, meetup: meetup4)
