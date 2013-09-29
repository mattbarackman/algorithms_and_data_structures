
def random_selection(array, index)
  pivot_point = (0...array.length).to_a.sample
  array, pivot_index = partition(array, pivot_point)
  if array[index] == array[pivot_index]
    array[pivot_index]
  elsif array[index] < array[pivot_index]
    random_selection(array[0...pivot_index], index)
  else
    random_selection(array[pivot_index...array.length], index - pivot_index)  
  end
end


def partition(array, pivot_point)
  array[0], array[pivot_point] = array[pivot_point], array[0] 
  pivot_boundry = 1
  unpartitioned_boundry = 1
  (1...array.length).each do |i|
    if array[i] < array[0]
      array[pivot_boundry], array[i] = array[i], array[pivot_boundry]
      pivot_boundry += 1
    end
    unpartitioned_boundry += 1
  end
  array[0], array[pivot_boundry-1] = array[pivot_boundry-1], array[0]
  return array, pivot_boundry-1
end

p random_selection([3,2,4,4,5,8,2], 3) == 4
p random_selection([2,3,4,5,8,1], 3) == 4
p random_selection([3,2,3,4,5,8], 3) == 4

