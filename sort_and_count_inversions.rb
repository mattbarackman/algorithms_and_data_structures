# This method piggy backs off of the merge sort algorithm to count the number of 
# inversions that exist in a given array. An inversion of two elements a[i] and a[j] 
# occurs when a[i] > a[j] and i < j. This algorithm uses a divide and conquer paradigm
# (similar to merge sort) to sort the first and second half of the arrays. During the merge
# step the number of inversions is counted by adding the number of elements that exist to 
# the right of the pointer in the sorted first half of the array every time you merge in an
# element from the second half of the array. It returns the sorted the array, plus the count
# of inversions that existed in the original. It has a runtime of O(nlog(n)). The n coefficient
# comes from each merge subroutine and the log(n) comes from the fact that you are dividing the
# array in half for each recursive call. 

def sort_and_count_inversions(array)
  array_length = array.length
  return array, 0 if array_length <= 1
  sorted_first_half, x = sort_and_count_inversions(array[0...array_length/2])
  sorted_second_half, y = sort_and_count_inversions(array[array_length/2..array_length])
  sorted_split, z = merge_sort_and_count(sorted_first_half, sorted_second_half)
  return sorted_split, x+y+z
end

def merge_sort_and_count(sorted_first_half, sorted_second_half)
  merged_and_sorted = []
  count = 0
  pointer1 = 0
  pointer2 = 0

  0.upto(sorted_first_half.length + sorted_second_half.length - 1) do |i|
    if sorted_first_half[pointer1].nil?
      merged_and_sorted[i] = sorted_second_half[pointer2]
      pointer2 += 1
    elsif sorted_second_half[pointer2].nil?
      merged_and_sorted[i] = sorted_first_half[pointer1]
      pointer1 += 1
    elsif sorted_first_half[pointer1] <= sorted_second_half[pointer2]
      merged_and_sorted[i] = sorted_first_half[pointer1]
      pointer1 += 1
    else
      merged_and_sorted[i] = sorted_second_half[pointer2]
      pointer2 += 1
      count += sorted_first_half[pointer1..-1].length
    end
  end

  return merged_and_sorted, count

end

p sort_and_count_inversions([])                 == [[], 0]
p sort_and_count_inversions([1])                == [[1], 0]
p sort_and_count_inversions([1, 5])             == [[1,5], 0]
p sort_and_count_inversions([4, 1])             == [[1,4], 1]
p sort_and_count_inversions([4, 1, 2, 3, 9])    == [[1,2,3,4,9], 3]
p sort_and_count_inversions([4, 1, 3, 2, 9, 5]) == [[1,2,3,4,5,9], 5]
p sort_and_count_inversions([4, 1, 3, 2, 9, 1]) == [[1,1,2,3,4,9], 8]