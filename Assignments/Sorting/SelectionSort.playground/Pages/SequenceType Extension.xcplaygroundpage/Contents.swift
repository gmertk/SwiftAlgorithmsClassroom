/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
    public func selectionSort(isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element] {
        var array = Array<Generator.Element>(self)
        
        for (i, _) in self.enumerate() {
            var index = i
            
            for (j, _) in self.enumerate() where j > i && isOrderedBefore(array[j], array[index]) {
                index = j
            }
            
            if index != i { swap(&array[i], &array[index]) }
        }
        
        return array
    }
}

assert([1, 3, 2].selectionSort(<).isSorted())
assert([1: "b", 2: "a"].selectionSort({$0.0 > $1.0}).isSorted({$0.0 > $1.0}))

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

