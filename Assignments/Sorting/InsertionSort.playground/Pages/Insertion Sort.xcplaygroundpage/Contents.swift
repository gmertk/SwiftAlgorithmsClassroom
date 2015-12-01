/*:

### 1. The Algorithm
Write an `insertionSort` function that takes an array and returns it as sorted by using `isOrderedBefore` closure. Don't mutate the original array (don't use `inout`).

Note that there is already a `swap` function in the standard library. However, you can move the larger elements to the right rather than using the `swap` function.

*/

func insertionSort<T>(var array: [T], @noescape isOrderedBefore: (T, T) -> Bool) -> [T] {
    for var i1 = 0; i1 < array.count; ++i1 {
        for var i2 = 0; i2 < array.count; ++i2 {
            if i1 != i2 {
                if isOrderedBefore(array[i1], array[i2]) {
                    swap(&array[i1], &array[i2])
                }
            }
        }
    }
    return array
}
//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.

let items = ["c", "d", "b"]
let sortedItems = insertionSort(items, isOrderedBefore: <)
assert(sortedItems.isSorted())
assert(items == ["c", "d", "b"]) // double check that items does not change

assert(insertionSort([1], isOrderedBefore: <).isSorted())
assert(insertionSort([1, 2, 3], isOrderedBefore: <).isSorted())
assert(insertionSort([1, 2, 3], isOrderedBefore: >).isSorted(>))
assert(insertionSort([3, 2, 1, 2, -1], isOrderedBefore: <).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

