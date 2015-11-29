/*:

### 1. The Algorithm
Write an `insertionSort` function that takes an array and returns it as sorted by using `isOrderedBefore` closure. Don't mutate the original array (don't use `inout`).

Note that there is already a `swap` function in the standard library. However, you can move the larger elements to the right rather than using the `swap` function.

*/

func insertionSort<T>(var array: [T], @noescape isOrderedBefore: (T, T) -> Bool) -> [T] {
    
    guard array.count > 1 else {
        return array
    }
    
    for index in 1..<array.count {
        var j:Int = index
        while j > 0 && !isOrderedBefore(array[j-1], array[j]) {
            swap(&array[j], &array[j-1])
            j--
        }
    }
    
    return array
}


//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.

let items = ["c", "d", "b"]
let sortedItems = insertionSort(items, isOrderedBefore: <)
assert(sortedItems.isSorted(<))
assert(items == ["c", "d", "b"]) // double check that items does not change

assert(insertionSort([1], isOrderedBefore: <).isSorted())
assert(insertionSort([1, 2, 3], isOrderedBefore: <).isSorted())
assert(insertionSort([1, 2, 3], isOrderedBefore: >).isSorted(>))
assert(insertionSort([3, 2, 1, 2, -1], isOrderedBefore: <).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

