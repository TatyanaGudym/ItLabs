# 2. There is a string. Find a maximum number of digits placed in a row in it


def find_max (string)
  string.split(' ').map(&:to_i).max.to_s.length
end

