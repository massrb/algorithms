
module StringOp
	def rotational_cipher(str, rotation_factor)
		str.chars.map do |c|
			if c.match(/[A-Za-z0-9]/)
				nxt =	(c.ord + rotation_factor).chr
			  case c 
			  	when 'A'..'Z' then
			  		if nxt > 'Z'
			  			dif = (nxt.ord - 'Z'.ord - 1) % 26
			  			nxt = ('A'.ord + dif).chr
			  		end
	        when 'a'..'z' then
	        	if nxt > 'z' then
	        		dif = (nxt.ord - 'z'.ord - 1) % 26
	        		nxt = ('a'.ord + dif).chr
	        	end
	        when '0'..'9' then
	          if nxt > '9'
	            dif = (nxt.ord - '9'.ord - 1) % 26
	            nxt = ('0'.ord + dif).chr
	          end
	      end
	    else
	    	nxt = c
	    end
      nxt
		end.join
  end

  module_function :rotational_cipher
end 