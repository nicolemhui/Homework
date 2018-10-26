
class Map
  attr_reader :map_arr

  def initialize(map_arr = [])
    @map_arr = map_arr
  end

  def set(key, value)
    if @map_arr.empty?
      @map_arr << [key, value]
    end

    @map_arr.each do |pair|
      if pair[0] == key
        pair[1] = value
      else
        @map_arr << [key, value]
      end
    end
    value
  end

  def get(key)
    @map_arr.each do |pair|
      pair if pair.include?(key)
    end
  end

  def delete(key)
    value = get(key)
    @map_arr.reject! do |pair|
      pair.include?(key)
    end
    value
  end

  def show
    deep_dup(@map_arr)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
