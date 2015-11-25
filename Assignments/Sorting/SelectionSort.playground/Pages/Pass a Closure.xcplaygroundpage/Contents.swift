/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/

func selectionSort<T>(var array: [T],@noescape isOrderedBefore: (T,T)->Bool) -> [T] {
    // You may declare array argument with var keyword so that it is copied.
    
    var min: Int
    
    for var i = 0; i < array.count-1; ++i {
        min = i
        for var j=i+1; j < array.count; ++j{
            if  isOrderedBefore(array[j],array[min]){
                min = j
            }
        }
        
        if min != i{
            swap(&array[min], &array[i])
        }
    }
    
    return array
}
    

assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

