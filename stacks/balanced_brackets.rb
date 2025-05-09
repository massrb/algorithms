=begin

A bracket is any of the following characters: (, ), 
{, }, [, or ].
We consider two brackets to be matching if the first 
bracket is an open-bracket, e.g., (, {, or [, and the 
second bracket is a close-bracket of the same type. 
That means ( and ), [ and ], and { and } are the only pairs 
of matching brackets.
Furthermore, a sequence of brackets is said to be balanced 
if the following conditions are met:

The sequence is empty, or

The sequence is composed of two or more non-empty sequences, all of which are balanced, or

The first and last brackets of the sequence are matching, and the portion of the sequence without the first and last elements is balanced.

=end

def balanced?(str)
  stack = []
  for i in 0...str.length
  	if ['{','[','('].include?(str[i])
  		stack.push(str[i])
  	elsif ['}',']',')'].include?(str[i])
  		elem = stack.pop
  		case elem
  		  when '['
  		    return false if str[i] != ']'
  		  when '{'
  		  	return false if str[i] != '}'
  		  when '('
  		  	return false if str[i] != ')'
  		end
  	end
  end
  return stack.empty?

end


def improved_balanced?(str)
  stack = []
  pairs = { ')' => '(', '}' => '{', ']' => '[' }

  str.each_char do |char|
    if pairs.values.include?(char)
      stack.push(char)
    elsif pairs.keys.include?(char)
      return false if stack.pop != pairs[char]
    end
  end

  stack.empty?
end
