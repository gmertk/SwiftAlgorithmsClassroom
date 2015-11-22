/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/

func selectionSort<T: Comparable>(var array: [T]) -> [T] {
    
    for j in array.startIndex..<array.endIndex - 1 {
        var iMin = j
        for i in j+1..<array.endIndex {
            if array[i] < array[iMin] {
                iMin = i
            }
        }
        if iMin != j {
            swap(&array[j], &array[iMin])
        }
    }
    return array
}




assert(selectionSort(["c", "a", "b", "asdfsd", "ljoiwer"]).isSorted())
assert(selectionSort([3, 2, 1, 5, 1234, 2341, 98]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

