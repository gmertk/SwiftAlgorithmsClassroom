/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/

func selectionSort<T>(var array: [T], isOrderedBefore: (T, T) -> Bool) -> [T] {
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
    

assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())
assert(selectionSort(["c", "a", "f", "b"], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

