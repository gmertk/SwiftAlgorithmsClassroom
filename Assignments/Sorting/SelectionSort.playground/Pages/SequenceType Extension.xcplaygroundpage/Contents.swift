/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
    func selectionSort(isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element] {
        var array = Array<Generator.Element>(self)
        for j in array.startIndex..<array.endIndex - 1 {
            var iMin = j
            for i in j+1..<array.endIndex {
                if isOrderedBefore(array[i], array[iMin]) {
                    iMin = i
                }
            }
            
            if iMin != j {
                swap(&array[j], &array[iMin])
            }
        }
        
        return array
    }
}

assert([1, 3, 2].selectionSort(<).isSorted())
assert([1: "b", 2: "a"].selectionSort({$0.0 > $1.0}).isSorted({$0.0 > $1.0}))
assert(Set<Int>([5, 1, 3, 2, 4]).selectionSort(<).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

