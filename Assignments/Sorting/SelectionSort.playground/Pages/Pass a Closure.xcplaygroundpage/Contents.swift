/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/

func selectionSort<X:Comparable>(array:[X], @noescape isOrderedBefore: (X,X) -> Bool) -> [X] {
    var anArray = array
    for index in 0..<anArray.count {
        let subArray = Array(anArray[index..<anArray.count])
        let minIndex = indexOfMin(subArray,isOrderedBefore: isOrderedBefore)
        if index+minIndex < anArray.count && minIndex != 0 {
            swap(&anArray[index], &anArray[index+minIndex])
        }
    }
    return anArray
}

func indexOfMin<X:Comparable>(array:[X],@noescape isOrderedBefore: (X,X) -> Bool) ->Int {
    var indexOfMin = 0
    for (index,value) in array.enumerate() {
        if isOrderedBefore(value, array[indexOfMin]) {
            indexOfMin = index
        }
    }
    return indexOfMin
}


assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

