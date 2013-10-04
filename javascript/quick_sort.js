function quickSort(array){
  if (array.length <= 1){
    return array;
  }
  var pivotIndex = randomPivot(array);
  var pivot = array[pivotIndex];
  array[pivotIndex] = array[0];
  array[0] = pivot;
  var partionBoundryPointer = 1;
  var activePointer = 1;
  for (var i = 0; i < array.length; i++){
    if (array[activePointer] < pivot){
      temp = array[activePointer];
      array[activePointer] = array[partionBoundryPointer];
      array[partionBoundryPointer] = temp;
      activePointer++;
      partionBoundryPointer++;
    } else {
      activePointer++;
    }
  }
  array[0] = array[partionBoundryPointer-1];
  array[partionBoundryPointer-1] = pivot;
  return quickSort(array.slice(0,partionBoundryPointer)).concat(quickSort(array.slice(partionBoundryPointer)));
}

function randomPivot(array){
  return Math.floor(Math.random()*array.length);
}

assert(quickSort([1,3,5,7,4,6,9,8,2,10]).compare([1,2,3,4,5,6,7,8,9,10]), "quickSort passed");
