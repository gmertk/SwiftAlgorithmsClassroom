/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
  func selectionSort(@noescape isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element] {
    func findMinIndex(array: [Generator.Element], startingFrom start: Int = 0, @noescape isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> Int? {
      guard 0..<array.count ~= start else {
        return nil
      }
      
      var minIndex = start
      for (index, value) in array[start..<array.count].enumerate() {
        if isOrderedBefore(value, array[minIndex]) {
          minIndex = index
        }
      }
      return minIndex + start
    }
    
    // an empty sequence or one that contains just one element is already sorted
    var array = Array(self)
    guard array.count > 1 else {
      return array
    }
    
    for i in 0..<array.count-1 {
      if let posmin = findMinIndex(array, startingFrom: i, isOrderedBefore: isOrderedBefore) {
        if i != posmin {
          swap(&array[i], &array[posmin])
        }
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

