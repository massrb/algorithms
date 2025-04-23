  class QuickSort < Algorithm
    def exec(array, first, last, depth=0)
      if first < last
        dbg_1 "depth:#{depth}, array at start: #{dbg_ar(array, first, last)}"
        j = partition(array, first, last)
        dbg 'array changed to:' + dbg_ar(array, first, last)
        dbg_2 "pivot on AR[#{j}](#{array[j]})"
        puts '============'
        exec(array, first, j-1, depth+1)
        exec(array, j+1, last, depth+1)
      end
      return array
    end

    def partition(array, first, last)
      dbg_8 "In partition start #{dbg_ar(array, first, last)}"
      pivot = array[last]
      # we use pIndex to swap smaller value 
      # elements into the left side of the array section
      pIndex = first
      i = first
      while i < last
        if array[i].to_i <= pivot.to_i
          dbg_4 "#{array[i]} <= #{pivot} = true"
          dbg_5 "SWAP(#{array[i]},#{array[pIndex]})"
          array[i], array[pIndex] = array[pIndex], array[i]
          pIndex += 1
          dbg_3 'ARRAY partition is:' + dbg_ar(array,first,last) + " pivot:#{pIndex}"
        end
        i += 1
      end
      array[pIndex], array[last] = array[last], array[pIndex]
      dbg_8 "In partition end #{dbg_ar(array, first, last)}"
      return pIndex
    end

  end
