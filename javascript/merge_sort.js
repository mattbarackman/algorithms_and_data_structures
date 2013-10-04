array = {};

var array = [0,1,2,3,4,5];

function mergeSort (array) {
   if (array.length <= 1){
    return array;
   }
   var midpoint = Math.floor(array.length/2);
   var first_half = mergeSort(array.slice(0,midpoint));
   var second_half = mergeSort(array.slice(midpoint,array.length+1));
   return merge(first_half, second_half);
}

function merge (array1, array2) {
  var iterations = array1.length + array2.length;
  var pointer1 = 0;
  var pointer2 = 0;
  var sorted = [];
  for (var i = 0; i < iterations; i++){
    if (array1[pointer1] !== undefined &&
        array2[pointer2] !== undefined &&
        array1[pointer1] <= array2[pointer2]){
        sorted.push(array1[pointer1]);
        pointer1++;
      } else if (array1[pointer1] !== undefined && array2[pointer2] !== undefined){
        sorted.push(array2[pointer2]);
        pointer2++;
      } else if (array1[pointer1] !== undefined) {
        sorted.push(array1[pointer1]);
        pointer1++;
      } else {
        sorted.push(array2[pointer2]);
        pointer2++;
    }
  }
  return sorted;
}


assert(mergeSort([1,3,5,7,4,6,9,8,2,10]).compare([1,2,3,4,5,6,7,8,9,10]), "mergeSort passed");
