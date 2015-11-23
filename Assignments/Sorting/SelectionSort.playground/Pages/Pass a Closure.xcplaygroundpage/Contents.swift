/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/
func selectionSort<T>(var array: [T], @noescape isOrderedBefore: (T, T) -> Bool) -> [T] {
    var minIndex:Int
    let length = array.count
    
    for i in 0..<length-1 {
        minIndex = i
        for j in i+1..<length {
            if isOrderedBefore(array[j], array[minIndex]) {
                minIndex = j
            }
        }
        if(minIndex != i){
            swap(&array[minIndex], &array[i])
        }
    }
    return array
}
    

assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

