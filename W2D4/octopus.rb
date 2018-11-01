def hungry_octopus(arr)
  longest = arr[0]
  arr.each do |el|
    if el.length > longest.length
      longest = el
    end
  end

  longest
end

def sluggish(arr)
  longest = arr[0]

  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      fish1 = arr[i]
      fish2 = arr[j]

      if fish1.length > fish2.length && i != j
        longest = fish1
      else
        longest = fish2
      end
    end
  end

  longest.length
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if self.length <= 1
    mid_idx = self.length / 2

    left = self[0...mid_idx].merge_sort(&prc)
    right = self[mid_idx..-1].merge_sort(&prc)

    self.merge(left, right ,&prc)
  end

  def merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) == 1
        result << right.shift
      else
        result << left.shift
      end
    end

    result + left + right
  end

  def dominant_octopus(arr)
    prc ||= Proc.new { |x, y| x <=> y }.sort
    arr.merge_sort(&prc).last
  end

  def clever_octopus(arr)
    biggest_fish = arr[0]

    arr.each do |fish|
      if fish.length > biggest_fish
        biggest_fish = fish
      end
    end

    biggest_fish
  end

  def slow_dance(direction, arr)
    arr.each_with_index do |dir, i|
      return i if direction == dir
    end
  end

  TILES_ARR = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  def fast_dance(direction, tiles_arr)
    tiles_arr.find_index(direction)
  end
end
