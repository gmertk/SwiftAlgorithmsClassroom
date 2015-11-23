/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/


func selectionSort<T:Comparable>(var array:[T]) -> [T] {
    
    for index in array.indices {
        var indexOfMinimumValue = index
        for innerIndex in index..<array.count {
            if array[innerIndex] < array[indexOfMinimumValue] {
                indexOfMinimumValue = innerIndex
            }
        }
        if indexOfMinimumValue != index {
            swap(&array[index], &array[indexOfMinimumValue])
        }
    }
    return array
}


assert(selectionSort(["c", "a", "b"]).isSorted())
assert(selectionSort([10, 1, 1000, -100, 10, 0, -1]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

