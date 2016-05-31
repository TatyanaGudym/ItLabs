# 1. Create method which gets 10 random integers (from 0 to 9) (generate it using while or until)
# before output for each next number we should puts "========="
# if number is even or odd it should puts string "the number is even" or "the number is odd"
# if it's more (or less) than 5 it should puts appropriate string "the number is more (or less) than 5"
# in case we've got "0" we should puts "we've got 0"
# in each case we should get 2 messages except the '0' case



def gets_random_10

  count = 0

while count < 10
  num = rand(9)
 first_string = "=========" + " #{num}"

  if num.odd?  and num!=0
    result = first_string + " the number is odd"
     if num < 5
       puts result + " the number is less than 5"
       elsif num > 5
         puts result + " the number is more than 5"
        else
       puts result + " the number is 5"
    end
    elsif num.even?  and num!=0
      result = first_string + " the number is even"
      if num < 5
        puts result + " the number is less than 5"
      elsif num > 5
        puts result + " the number is more than 5"
      else
        puts result + " the number is 5"
      end
  elsif num == 0
       puts first_string + " we've got 0"
  else
  puts "I can't guess the number"
  end

  count += 1
end
end

gets_random_10





