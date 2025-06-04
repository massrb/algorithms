

# basic pattern matching for .*, a*

def is_match(s,p)
  j = 0
  i = 0
  while i < s.length
    cur = s[i]
    pchar = p[j]
    pnext = j+1 < p.length ? p[j+1] : nil
    any_c = true if pchar == '.' and pnext == '*'
    return true if any_c

    if pnext == '*'
      mult_c = pchar
      mult_mode = true
    else
      mult_mode = false
    end
    if pchar == cur
      i += 1
      j += 1 unless mult_mode
    elsif mult_mode
      j += 2
      mult_mode = false
    else
      return false
    end
  end
  return true
end

# O(2^(m+n)) - exponential but ok for small strings
def is_match2(s, p)
  return true if p.empty?
  
  first_match = !s.empty? && (s[0] == p[0] || p[0] == '.')

  if p.length >= 2 && p[1] == '*'
    # Try 0 of preceding char OR consume one char if match
    return is_match(s, p[2..-1]) || (first_match && is_match(s[1..-1], p))
  else
    return first_match && is_match(s[1..-1], p[1..-1])
  end
end