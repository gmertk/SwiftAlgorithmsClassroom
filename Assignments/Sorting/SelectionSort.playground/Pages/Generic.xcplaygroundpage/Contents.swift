/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/


func selectionSort<T: Comparable>(var array: [T]) -> [T] {
  func findMinIndex(array: [T], startingFrom start: Int = 0) -> Int? {
    guard 0..<array.count ~= start else {
      return nil
    }
    
    var minIndex = start
    for (index, value) in array[start..<array.count].enumerate() {
      if value < array[minIndex] {
        minIndex = index + start
      }
    }
    return minIndex
  }
  
  // an empty array or one that contains just one element is already sorted
  guard array.count > 1 else {
    return array
  }
  
  for i in 0..<array.count-1 {
    if let posmin = findMinIndex(array, startingFrom: i) {
      if i != posmin {
        swap(&array[i], &array[posmin])
      }
    }
  }
  
  return array
}




assert(selectionSort(["c", "a", "b"]).isSorted())
assert(selectionSort(["z", "x", "y"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

