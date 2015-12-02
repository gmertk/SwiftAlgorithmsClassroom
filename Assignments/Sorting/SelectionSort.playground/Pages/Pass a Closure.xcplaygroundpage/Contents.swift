/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/
func selectionSort<T>(var array: [T], @noescape isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else {return array}
    
    func minIndex(array: [T], startIndex: Int, @noescape isOrderedBefore: (T, T) -> Bool) -> Int {
        var minIndex = startIndex
        for i in startIndex+1..<array.count where isOrderedBefore(array[i], array[minIndex]) {
            minIndex = i
        }
        return minIndex
    }
    
    for i in 0..<array.count {
        let minPos = minIndex(array, startIndex: i, isOrderedBefore: isOrderedBefore)
        if i != minPos {
            swap(&array[i], &array[minPos])
        }
    }
    
    return array
}


assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

