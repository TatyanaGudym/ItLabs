#7. There is an array of integers (ary).
# Modify it with adding ary[0] (first element of the array) to each even number.
# Don't do it for first and last elements

#ary = [1,2,3,4,5,6,7,8,9]
ary.slice(1...-1).map{|x| x + ary[0] if x.even?}.compact!
