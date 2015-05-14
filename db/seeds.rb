
10.times do
	User.create!(
		first_name: Faker::Internet.user_name,
    last_name: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: 'password'
	)
	print "U"
end

users = User.all


20.times do

	pr = Project.create!(
		title: Faker::Commerce.product_name,
	  description: Faker::Hacker.say_something_smart,
  	user: users.sample,
  	goal_amount: Faker::Commerce.price
  )
  print "P"

  10.times do |n|
		pr.rewards.create!(
			title: Faker::Commerce.product_name,
     	description: Faker::Hacker.say_something_smart,
    	backer_limit: Faker::Number.number(3),
    	amount: 15*(3**n)
		)
		print "R"
	end
end


