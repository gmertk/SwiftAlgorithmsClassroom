/*:

### 3. Pass a Closure
Instead of sorting the array in ascending order, modify your function to accept a closure that takes two arguments of the same type as the array’s contents, and returns Bool. You can name this closure parameter `isOrderedBefore` (as in the `sort` function of the standard library).
****
Also check what `@noescape` means in Swift.
****
Since you now use another function to do the comparison, you can remove the `Comparable` constraint.
*/

func selectionSort<T: Comparable>(var sequence: [T], isOrderedBefore: (T, T) -> Bool = { $0 < $1 }) -> [T] {
    
    for (i, _) in sequence.enumerate() {
        var index = i
        
        for (j, _) in sequence.enumerate() where j > i && isOrderedBefore(sequence[j], sequence[index]) {
            index = j
        }
        
        if index != i { swap(&sequence[i], &sequence[index]) }
    }
    
    return sequence
}
    

assert(selectionSort([3, 1, 2]).isSorted())
assert(selectionSort([3, 1, 2], isOrderedBefore: <).isSorted())
assert(selectionSort([3, 1, 2], isOrderedBefore: >).reverse().isSorted())


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

