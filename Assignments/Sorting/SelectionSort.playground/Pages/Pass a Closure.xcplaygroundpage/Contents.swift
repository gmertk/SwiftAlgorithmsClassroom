/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/


func selectionSort<T>(var array: [T], @noescape isOrderedBefore: (T, T) -> Bool) -> [T] {
  func findMinIndex(array: [T], startingFrom start: Int = 0, @noescape isOrderedBefore: (T, T) -> Bool) -> Int {
    var minIndex = start
    for (index, value) in array[start..<array.count].enumerate() {
      if isOrderedBefore(value, array[minIndex]) {
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
    let posmin = findMinIndex(array, startingFrom: i, isOrderedBefore: isOrderedBefore)
    if i != posmin {
      swap(&array[i], &array[posmin])
    }
  }
  
  return array
}


assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())
assert(selectionSort(["c", "a", "b"], isOrderedBefore: <).isSorted())
assert(selectionSort(["z", "x", "y"], isOrderedBefore: <).isSorted())
assert(selectionSort([1], isOrderedBefore: <).isSorted())
assert(selectionSort([1, 2, 3], isOrderedBefore: <).isSorted())
assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())
assert(selectionSort([3, 2, 1, 2, 1], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

