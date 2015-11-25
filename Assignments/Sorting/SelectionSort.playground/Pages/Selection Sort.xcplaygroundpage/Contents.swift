/*:

### 1. The Algorithm
Write a `selectionSort` function that takes an integer array and returns it as sorted in ascending order. Don't mutate the original array (don't use `inout`). 

Note that there is already a `swap` function in the standard library. You need to guard it from swapping a location with itself.
****
Better define an inner function to find the next minimum in the array.

*/


func selectionSort(var array: [Int]) -> [Int] {
  func findMinIndex(array: [Int], startingFrom start: Int = 0) -> Int? {
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


//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.
assert(selectionSort([]).isSorted())
assert(selectionSort([1]).isSorted())
assert(selectionSort([1, 2, 3]).isSorted())
assert(selectionSort([3, 1, 2]).isSorted())
assert(selectionSort([3, 2, 1, 2, 1]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

