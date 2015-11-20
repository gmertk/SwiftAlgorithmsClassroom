/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
  
  func selectionSort(@noescape isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element] {
    
    var array = Array<Generator.Element>(self)
    
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
}

assert([1, 3, 2].selectionSort(<).isSorted())
assert([1: "b", 2: "a"].selectionSort({$0.0 > $1.0}).isSorted({$0.0 > $1.0}))

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

