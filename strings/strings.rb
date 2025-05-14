
# two words are one edit away if they can be made equal by
# removing, replacing or adding one character

def one_edit_apart(s1, s2)
	# puts "================="
	# puts "#{s1}==#{s2}"
	return false if s1 == s2
  offby = 0
  j = 0
  i = 0
  while i < s1.length
  	# puts "#{s1[i]}==#{s2[j]}"
  	if s1[i] == s2[j]
  	  j += 1
  	  i += 1
  	else
  		offby += 1
  		return false if offby > 1
  		if s1[i+1] == s2[j+1]
  			i += 1
  			j += 1
  		elsif s1[i] != s2[j+1]
  		  i += 1
  		elsif s2[j] != s1[i+1]
  			j += 1
  		else
  			i += 1
  		end
  	end 
  end
  if i < s1.length || j < s2.length
  	offby += 1 unless offby > 0
  end
  offby == 1
end