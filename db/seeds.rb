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



# --------------------
# ------ DOGS --------
# --------------------
nala = Dog.create(name: "Nala", age: "Adult", breed: "Dachshund", size: "S", sex: "Female", short_bio: "The baddest one of them all", picture_url: "https://cdn1.imggmi.com/uploads/2018/10/11/684211d9d6bf2982830428552cc0566d-full.png", owner: nancy)



# --------------------
# ------ MEETUPS -----
# --------------------
meetup1 = Meetup.create(date: "20181028", address: "25219 Kuykendahl Road #G110", zip_code: 77375, location_name: "Craft Grill", time: "7:00")



# -------------------------------------
# ------ OWNER-MEETUP ASSOCIATION -----
# -------------------------------------
nancy_meetup1 = OwnerMeetup.create(owner: nancy, meetup: meetup1)
