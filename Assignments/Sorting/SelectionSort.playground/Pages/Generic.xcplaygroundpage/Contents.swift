/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/

func selectionSort<T:Comparable>(var array: [T]) -> [T] {
    guard array.count > 1 else {return array}
    
    func minIndex(array: [T], startIndex: Int) -> Int {
        var minIndex = startIndex
        for i in startIndex+1..<array.count where array[i] < array[minIndex] {
            minIndex = i
        }
        return minIndex
    }
    
    for i in 0..<array.count {
        let minPos = minIndex(array, startIndex: i)
        if i != minPos {
            swap(&array[i], &array[minPos])
        }
    }
    
    return array
}





assert(selectionSort(["c", "a", "b"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

