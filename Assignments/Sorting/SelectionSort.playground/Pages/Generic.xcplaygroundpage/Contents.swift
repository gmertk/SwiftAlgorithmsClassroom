/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/

func selectionSort<T: Comparable>(var array: [T]) -> [T] {
  
  let length = array.count
  var indexOfMinimum: Int
  
  for var i = 0; i < (length - 1); i++ {
    
    indexOfMinimum = i
    
    for (j, value) in array.enumerate() where j > i && value < array[indexOfMinimum] {
      
      indexOfMinimum = j
    }
    
    if indexOfMinimum != i {
      
      swap(&array[i], &array[indexOfMinimum])
    }
  }
  
  
  return array
}

assert(selectionSort(["c", "a", "b"]).isSorted())
assert(selectionSort(["c", "a", "a", "b", "a"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

