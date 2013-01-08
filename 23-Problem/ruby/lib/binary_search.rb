class BinarySearch
  def self.exists?(array, mem)
    find(array, mem).nil? ? false : true
  end

  def self.find(array, mem, l = nil, u = nil)
    l ||= 0
    u ||= array.length - 1
    i = (l + u) / 2
    return i if array[i] == mem
    return find(array, mem, i + 1, u) if (array[i] < mem) && (i + 1) != l
    return find(array, mem, l, i - 1) if (array[i] > mem) && (i - 1) != u
    nil
  end
end
