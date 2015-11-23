/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
    
    func selectionSort(@noescape isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element] {
        var array = Array(self)
        for index in array.indices {
            var indexOfMinimumValue = index
            for innerIndex in index..<array.count {
                if isOrderedBefore (array[innerIndex], array[indexOfMinimumValue]) {
                    indexOfMinimumValue = innerIndex
                }
            }
            if indexOfMinimumValue != index {
                swap(&array[index], &array[indexOfMinimumValue])
            }
        }
        return array
    }
}

assert([1, 3, 2].selectionSort(<).isSorted())
assert([1: "b", 2: "a"].selectionSort({$0.0 > $1.0}).isSorted({$0.0 > $1.0}))
assert(["c", "a", "b"].selectionSort(<).isSorted())
assert([10, 1, 1000, -100, 10, 0, -1].selectionSort(<).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

