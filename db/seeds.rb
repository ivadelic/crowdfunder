100.times do 

	Project.create(
	title: Faker::Commerce.product_name,
  description: Faker::Hacker.say_something_smart
      )

end