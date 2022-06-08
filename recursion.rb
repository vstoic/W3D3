# def itr_range(start, last)
#     return [] if last < start 
#      (start...last).map {|ele| ele}
# end

# # p itr_range(1, 10)

# def rec_range(start, last)
#     return [] if last <= start 
#     arr = rec_range(start,last-1)
#     arr << last-1
#     arr
# end


# exp(b, n) = b * exp(b, n - 1)
# exponent(base, power) = base * exponent(base, power - 1)
# smaller_exponent = power - 1
# base_to_the_smaller_exponent = exponent(base, smaller_exponent)
# exponent(base, power) = base * base_to_the_smaller_exponent

# def exponent(base, power)
#     return 1 if power == 0 
#     base * exponent(base, power - 1)
# end

# # # p exponent(2, 5000)

# $count = 0
# def exponent2(base, power)
#     $count += 1
#     return 1 if power == 0
#     return base if power == 1
#     if power.even? 
#         exponent2(base, power / 2) ** 2
#     else
#         base * (exponent2(base, (power - 1) / 2 ) ** 2)
#     end
# end

# p exponent2(2, 256)
# p $count

# class Array
#     def deep_dup
#         copy = []
#         self.each do |ele|
#             if ele.is_a?(Array)
#                copy << ele.deep_dup
#             else
#                 copy << ele
#             end
#         end
#         copy
#     end
# end

#  old_arr = [1, [2], [3, [4]]]
#  new_arr = old_arr.deep_dup
#  new_arr << [9,10]
#  p new_arr
#  p old_arr

# def fibonacci(int)
#     return [1] if int == 1
#     return [1,1] if int == 2
#     arr = fibonacci(int -1)
#     arr << arr[-1]+ arr[-2]
#     arr
# end

# def fib_irt(n)
#     return [1] if n == 1
#     return [1,1] if n == 2
#     count = 2
#     arr = [1,1]
#     while count < n
#         arr << arr[-1]+arr[-2]
#         count += 1
#     end
#     arr
# end

# p fib_irt(5 )

# def bsearch(array, target)
#     arr = array.sort  
#     return nil if (arr.length == 1 ) && (arr[0] != target)
#         if target > arr[arr.length/2] 
#             bsearch(arr[arr.length/2+1..-1],target)
#         elsif target < arr[arr.length/2]
#             bsearch(arr[0...arr.length/2],target)
#         else
#             return arr.length/2
#         end
# end
def bsearch(arr, target) 
    return arr if (arr.length == 1 )
    mid_idx = arr.length/2

    if target > arr[arr.length/2] 
            bsearch(arr.slice(mid_idx + 1, -1), target)
    elsif target < arr[arr.length/2]
            bsearch(arr.slice(arr.length/2 - 1, 0), target)
    else 
        return mid_idx
    end
       
end

# def bsearch(array, target,min_idx= 0,max_idx = array.length-1)
#     # array = array.sort  
#     mid_idx = (min_idx+max_idx)/2
#     return nil if mid_idx == 0 && array[0] != target
#     if (target <=> array[mid_idx]) == 0
#         return mid_idx
#     elsif (target <=> array[mid_idx]) == -1
#         max_idx = mid_idx -1
#         bsearch(array,target,min_idx,max_idx)
#     else
#         min_idx = mid_idx + 1
#         bsearch(array,target,min_idx,max_idx)
#     end
# end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil