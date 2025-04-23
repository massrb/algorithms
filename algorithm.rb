

class Algorithm

  def initialize(dbg_level)
    @dbg_level = dbg_level
  end

  def dbg(str, lev=0)
    puts str if lev <= @dbg_level
  end

  def dbg_ar(ar, first, last)
    str = "["
    str += '.. ' if first > 0
    str += "#{ar[first..last].join(', ')}"
    str += " .." if last + 1 < ar.length
    str += ']'
    if first != 0 || last + 1 < ar.length
      str += " [#{first}..#{last}]"
    end
    str
  end

  def method_missing(m, *args, &block)
    mat = m.to_s.match(/dbg_(\d+)/)
    if mat
      # call to dbg_3(str) becomes dbg(str, 3)
      dbg(args[0], mat[1].to_i)
    end
  end

end
