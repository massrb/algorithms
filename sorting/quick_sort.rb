  class QuickSort < Sorting
    def exec(array, first, last)
      if first < last
        j = partition(array, first, last)
        dbg 'array changed to:' + array.inspect
        dbg_2 "pivot on AR[#{j}](#{array[j]})"
        puts '============'
        exec(array, first, j-1)
        exec(array, j+1, last)
      end
      return array
    end

    def partition(array, first, last)
      pivot = array[last]
      pIndex = first
      i = first
      while i < last
        if array[i].to_i <= pivot.to_i
          array[i], array[pIndex] = array[pIndex], array[i]
          pIndex += 1
          dbg_3 'ARRAY partition is:' + array.inspect
        end
      i += 1
      end
      array[pIndex], array[last] = array[last], array[pIndex]
      return pIndex
    end

  end
