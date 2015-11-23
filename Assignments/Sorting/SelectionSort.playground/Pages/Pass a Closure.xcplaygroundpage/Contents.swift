/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/

func selectionSort<T>(var array:[T], @noescape isOrderedBefore: (T, T) -> Bool) -> [T] {
    
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
    

assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())
assert(selectionSort(["c", "a", "b"], isOrderedBefore: <).isSorted())
assert(selectionSort([10, 1, 1000, -100, 10, 0, -1], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

