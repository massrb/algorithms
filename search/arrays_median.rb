
# https://www.youtube.com/watch?v=q6IEA26hvXc

def median_of_arrays(nums1, nums2)
  # Ensure nums1 is the smaller array for binary search efficiency
  if nums1.length > nums2.length
    nums1, nums2 = nums2, nums1
  end

  puts "#{nums1}"
  puts "#{nums2}"

  m = nums1.length
  n = nums2.length
  imin, imax, half_len = 0, m, (m + n + 1) / 2

  puts "imin: #{imin}, imax:#{imax}, half:#{half_len}"
  puts "total length: #{m+n}"

  while imin <= imax
    i = (imin + imax) / 2
    j = half_len - i
    puts "imin:#{imin} imax:#{imax} i:#{i} j:#{j}"

    if i < m && nums2[j - 1] > nums1[i]
      puts "nums2[j - 1] > nums1[i] - (#{nums2[j - 1]} > #{nums1[i]})"
      # i is too small, must increase it
      imin = i + 1
    elsif i > 0 && nums1[i - 1] > nums2[j]
      puts "nums1[i - 1] > nums2[j] - (#{nums1[i - 1]} > #{nums2[j]})"
      # i is too big, must decrease it
      imax = i - 1
    else
      # i is perfect

      max_of_left = if i == 0
                      nums2[j - 1]
                    elsif j == 0
                      nums1[i - 1]
                    else
                      [nums1[i - 1], nums2[j - 1]].max
                    end

      return max_of_left if (m + n).odd?

      min_of_right = if i == m
                       nums2[j]
                     elsif j == n
                       nums1[i]
                     else
                       [nums1[i], nums2[j]].min
                     end

      return (max_of_left + min_of_right) / 2.0
    end
    puts "---------------"
  end

  raise "Input arrays are not sorted or invalid"
end