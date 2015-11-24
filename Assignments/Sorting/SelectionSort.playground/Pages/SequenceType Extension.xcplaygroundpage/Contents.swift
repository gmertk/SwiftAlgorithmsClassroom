/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
    func selectionSort( @noescape isOrderedBefore: (Generator.Element,Generator.Element) -> Bool) -> [Generator.Element] {
        func indexOfMin(array:[Generator.Element],@noescape isOrderedBefore: (Generator.Element,Generator.Element) -> Bool) ->Int {
            var indexOfMin = 0
            for (index,value) in array.enumerate() {
                if isOrderedBefore(value, array[indexOfMin]) {
                    indexOfMin = index
                }
            }
            return indexOfMin
        }
        
        var array = Array(self)
        guard array.count > 1 else {
            return array
        }
        var index = 0
        while(!array.isSorted(isOrderedBefore)) {
            let subArray = Array(array[index..<array.count])
            let minIndex = indexOfMin(subArray,isOrderedBefore: isOrderedBefore)
            if index+minIndex < array.count && minIndex != 0 {
                swap(&array[index], &array[index+minIndex])
            }
            index++
        }
        return array
        
    }
    
  
}
assert([1, 3, 2].selectionSort(<).isSorted())
assert([1: "b", 2: "a"].selectionSort({$0.0 > $1.0}).isSorted({$0.0 > $1.0}))

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

