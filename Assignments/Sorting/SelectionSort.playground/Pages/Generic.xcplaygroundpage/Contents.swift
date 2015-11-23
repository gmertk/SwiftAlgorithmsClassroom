/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/

func selectionSort<T: Comparable>(var sequence: [T]) -> [T] {
    
    for (i, _) in sequence.enumerate() {
        var index = i
        
        for (j, _) in sequence.enumerate() where j > i && sequence[j] < sequence[index] {
            index = j
        }
        
        if index != i { swap(&sequence[i], &sequence[index]) }
    }
    
    return sequence
}




assert(selectionSort(["c", "a", "b"]).isSorted())
assert(selectionSort(["c", "a", "a", "b", "a"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

