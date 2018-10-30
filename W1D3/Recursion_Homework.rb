def sum_to(n)
  return 1 if n == 1
  n + sum_to(n - 1)
end

def add_numbers(nums_array)
  return nums_array[0] if nums_array.length == 1
  nums_array.pop + add_numbers(nums_array)
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1

  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.length == 0
  flavors.pop == favorite ? true : ice_cream_shop(flavors, favorite)
end

def reverse(string)
  return "" if string.length == 0
  string[-1] + reverse(string[0..-2])
end
