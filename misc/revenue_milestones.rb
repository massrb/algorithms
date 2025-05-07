
# We keep track of the revenue that we make every day, 
# and we want to know on what 
# days we hit certain revenue milestones. 
# Given an array of the revenue on each day, 
# and an array of milestones that we wants to reach, 
# return an array containing the days on which we reached every milestone

def get_milestone_days(revenues, milestones)
	met = []
	sum = 0
	m = 0
	for r in 0...revenues.length
		sum += revenues[r]
		if sum >= milestones[m]
			met << r + 1
			m += 1
		end
	end
	return met
end