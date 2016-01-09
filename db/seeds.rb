# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # vendor account
  vendor = User.create(email: "vendor@foodeals.com", password: "testvendor123", is_vendor: true)
  puts "vendor login - #{vendor.email} - #{vendor.password}"

  eatery = Eatery.create(
    eatery_name: "resturant 1",
    eatery_description: "resturant description",
    eatery_contact: "408-111-1111",
    eatery_email: "resturant1@foodeals.com",
    eatery_address: "sanjose, USA",
    image: File.open(File.join(Rails.root, "/app/assets/images/resturant.jpg")),
    user_id: vendor.id)

  image = ""
  (1..8).each do |object|
    if object.even?
      image = "/app/assets/images/deal1.jpg"
    else
      image = "/app/assets/images/deal1.jpg"
    end
    Deal.create(
      name: "deal #{object}",
      description: "cheaper deal #{object}",
      current_amount: 15.32,
      previous_amount: 22.32,
      expiry: 10.days.from_now,
      available_coupons: 10,
      sold_coupons: 0,
      eatery_id: eatery.id,
      image: File.open(File.join(Rails.root, image))
    )
  end
  # User account
  user = User.create(email: "first_user@foodeals.com", password: "testuser123")

  puts "user login - #{user.email} - #{user.password}"
