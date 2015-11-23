/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
    func selectionSort(isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element]{
        
        var toSort = Array<Generator.Element>(self)
        
        let numberOfElements = toSort.count
        
        for i in 0..<numberOfElements-1 {
            
            var minIndex = i
            
            for j in i+1..<numberOfElements {
                if isOrderedBefore(toSort[j], toSort[minIndex]) {
                    minIndex = j
                }
            }
            
            if(minIndex != i){
                swap(&toSort[i], &toSort[minIndex])
            }
        }
        
        return toSort
    }

}

assert([1, 3, 2].selectionSort(<).isSorted())
assert([1: "b", 2: "a"].selectionSort({$0.0 > $1.0}).isSorted({$0.0 > $1.0}))

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

