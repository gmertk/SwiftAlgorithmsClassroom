/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/
func selectionSort<T>(toSort: [T], isOrderedBefore: (T, T) -> Bool) -> [T]{

    let numberOfElements = toSort.count

    var sortedArray = toSort

    for i in 0..<numberOfElements-1 {

        var minIndex = i

        for j in i+1..<numberOfElements {
            if isOrderedBefore(sortedArray[j], sortedArray[minIndex]) {
                minIndex = j
            }
        }

        if(minIndex != i){
            swap(&sortedArray[i], &sortedArray[minIndex])
        }
    }


    return sortedArray

}

    

assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

