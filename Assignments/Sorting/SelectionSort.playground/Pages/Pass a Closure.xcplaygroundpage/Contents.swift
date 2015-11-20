/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/

func selectionSort<T>(var array: [T], @noescape isOrderedBefore: (T, T) -> Bool) -> [T] {
  
  let length = array.count
  var indexToSwap: Int
  
  for var i = 0; i < (length - 1); i++ {
    
    indexToSwap = i
    
    for (j, value) in array.enumerate() where j > i && isOrderedBefore(value, array[indexToSwap]) {
      
      indexToSwap = j
    }
    
    if indexToSwap != i {
      
      swap(&array[i], &array[indexToSwap])
    }
  }
  
  
  return array
}


assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())
assert(selectionSort([3, 1, 2], isOrderedBefore: >).reverse().isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

