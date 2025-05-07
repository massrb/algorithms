
# 
# We have N different apps with different user growth rates. At a given time t, 
# measured in days, the number of users using an app is g^t (for simplicity we'll 
# allow fractional users), where g is the growth rate for that app. These apps will # all be launched at the same time and no user ever uses more than one of the apps. 
# We want to know how many total users there are when you add together the number of 
# users from each app.
# After how many full days will we have 1 billion total users across the N apps?
# 

def get_billion_users(growth_rates)
	day = 0
	users = 0
	done = false
	count = 10
	while !done
		day += 1
		users = 0
		growth_rates.each do |rate|
			users += rate**day
		end
		done = users >= 1_000_000_000
	end
	day
end