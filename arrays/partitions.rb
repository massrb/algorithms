
# array of numbers, find three numbers that add up closest to a given number X.

def partitions_for(arr, x)
  closest = [1_000_000_000_000_000_000,0,0]
  for i in 0...arr.length
    for j in i+1...arr.length
      for k in j+1...arr.length
        cur_dist = (closest.sum - x).abs
        this_dist = (arr[i]+arr[j]+arr[k] - x).abs
        if this_dist < cur_dist
          closest = [arr[i],arr[j],arr[k]]
        end
      end
    end
  end
  closest
end