# 4. There are two strings. Find number of first matching chars

def method_4 (str1, str2)
  (str1.chars & str2.chars).length
end

