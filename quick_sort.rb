# this is an implementation of the well-known quick sort algorithm. it uses 
# a random pivot point and has an average runtime of O(nlog(n)). It has a 
# worst case runtime of O(n^2). this particular implementation modifies the 
# array in place which is the main benefit of using the quick sort algorithm
# compared to the merge sort algorithm.

def quick_sort(array)
  return array if array.length <= 1
  pivot_point = (0...array.length).to_a.sample
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
  quick_sort(array[0...pivot_boundry]) + quick_sort(array[pivot_boundry...array.length])
end

p quick_sort([1,5,6,3,8,4,7,10,2,9]) == [1,2,3,4,5,6,7,8,9,10]