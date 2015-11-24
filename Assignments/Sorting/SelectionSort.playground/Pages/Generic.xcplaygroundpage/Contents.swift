/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/
func selectionSort<T:Comparable>(var array: [T]) -> [T] {
    // You may declare array argument with var keyword so that it is copied.
    func minPosition(array: [T], start: Int) -> Int {
        var minPos = start
        for i in start..<array.count where array[i] < array[minPos] {
            minPos = i
        }
        return minPos
    }

    for i in 0..<array.count {
        let minIndex = minPosition(array, start: i)
        if i != minIndex {
            swap(&array[i], &array[minIndex])
        }
    }

    return array
}


assert(selectionSort(["c", "b", "d", "a", "A"]).isSorted())
assert(selectionSort(["c", "a", "b"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

