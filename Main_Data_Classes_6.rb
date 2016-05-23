# 6. There is an array of integers (ary). Puts the index of the last element where ary[0]<ary[i]<ary[-1]

last = ary.rindex(ary[0...-1].last)
puts last




