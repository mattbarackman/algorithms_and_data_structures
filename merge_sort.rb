
def merge_sort(array)
  array_length = array.length
  return array if array_length <= 1

  first_half = merge_sort(array[0...array_length/2])
  second_half = merge_sort(array[array_length/2..array_length])

  sorted_array = []
  pointer1, pointer2 = 0, 0

  (0).upto(array.length-1) do |i|
    if first_half[pointer1].nil?
      sorted_array[i] = second_half[pointer2]
      pointer2 += 1
    elsif second_half[pointer2].nil?
      sorted_array[i] = first_half[pointer1]
      pointer1 += 1
    elsif first_half[pointer1] < second_half[pointer2]
      sorted_array[i] = first_half[pointer1]
      pointer1 += 1
    else
      sorted_array[i] = second_half[pointer2]
      pointer2 += 1
    end
  end
  sorted_array
end

puts merge_sort([]) == []
puts merge_sort([1]) == [1]
puts merge_sort([1,1]) == [1,1]
puts merge_sort([2,1,2]) == [1,2,2]
puts merge_sort([5,4,1,8,7,2,6,3]) == [1,2,3,4,5,6,7,8]
