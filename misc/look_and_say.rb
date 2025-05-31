
=begin

sequence

1 → “one 1” → 11

11 → “two 1s” → 21

21 → “one 2, one 1” → 1211

1211 → “one 1, one 2, two 1s” → 111221

111221 → “three 1s, two 2s, one 1” → 312211

312211 → “one 3, one 1, two 2s, two 1s” → 13112221

13112221 → “one 1, one 3, two 1s, three 2s, one 1” → 1113213211
		
=end


def print_look_and_say_seq(count = 0)
  val = "1"
  (1..count).each do
    puts val
    val = output_val(val)
  end
  val
end

def output_val(input)
  input = input.to_s
  return "1#{input}" if input.length == 1

  ret = ''
  cur = input[0]
  count = 1
  # 13112221 - len:8
  # cur:1
  # count += 1
  # ----
  # count 2
  # i:2
  # 
  (1..input.length).each do |i|
    if i == input.length || input[i] != cur
      ret += "#{count}#{cur}"
      cur = input[i]
      count = 1
    else
      count += 1
    end
  end

  ret
end