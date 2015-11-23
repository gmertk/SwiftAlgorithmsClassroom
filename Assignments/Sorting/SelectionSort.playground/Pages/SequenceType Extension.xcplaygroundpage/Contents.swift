/*:

### 4. SequenceType Extension

Instead of only sorting arrays, modify your function to sort any type conforming to `SequenceType`. So make your function to be an extension of `SequenceType` so that we can use it as `[1, 3, 2].selectionSort(<)` and `[1: "b", 2: "a"].selectionSort {$0.0 > $1.0}`.
*/

extension SequenceType {
    
    func selectionSort(isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element] {
        var array = Array<Generator.Element>(self)
        var minIndex:Int
        let length = array.count
        
        for i in 0..<length-1 {
            minIndex = i
            for j in i+1..<length {
                if isOrderedBefore(array[j], array[minIndex]) {
                    minIndex = j
                }
            }
            if(minIndex != i){
                swap(&array[minIndex], &array[i])
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

