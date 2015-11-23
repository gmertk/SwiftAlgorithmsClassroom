/*:

### 1. The Algorithm
Write a `selectionSort` function that takes an integer array and returns it as sorted in ascending order. Don't mutate the original array (don't use `inout`). 

Note that there is already a `swap` function in the standard library. You need to guard it from swapping a location with itself.
****
Better define an inner function to find the next minimum in the array.

*/

func selectionSort(var array: [Int]) -> [Int] {
    
    for index in array.indices {
        var indexOfMinimumValue = index
        for innerIndex in index + 1..<array.count {
            if array[innerIndex] < array[indexOfMinimumValue] {
                indexOfMinimumValue = innerIndex
            }
        }
        if indexOfMinimumValue != index {
            swap(&array[index], &array[indexOfMinimumValue])
        }
    }
    return array
}


//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.

assert(selectionSort([1]).isSorted())
assert(selectionSort([1, 2, 3]).isSorted())
assert(selectionSort([3, 1, 2]).isSorted())
assert(selectionSort([3, 2, 1, 2, 1]).isSorted())
assert(selectionSort([10, 1, 1000, -100, 10, 0, -1]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

