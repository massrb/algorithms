=begin
You likely know that different currencies have coins 
and bills of different denominations. In some currencies, 
it's actually impossible to receive change for a given amount 
of money. For example, Canada has given up the 1-cent penny. 
If you're owed 94 cents in Canada, a shopkeeper will graciously 
supply you with 95 cents instead since there exists a 5-cent coin.
Given a list of the available denominations, determine if it's 
possible to receive exact change for an amount of money targetMoney. 
Both the denominations and target amount will be given in generic 
units of that currency.
=end

def exact_change?(money_owed, denominations)
	return true if money_owed == 0
	i = denominations.length - 1
	while(i >= 0 && denominations[i] > money_owed) do
		i-= 1
	end
	if i >= 0
	  count = money_owed / denominations[i]
	  money_owed = money_owed % denominations[i]
	  return exact_change?(money_owed, denominations)
  else
  	false
  end
end