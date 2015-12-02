/*:

### 1. The Algorithm
Write a `selectionSort` function that takes an integer array and returns it as sorted in ascending order. Don't mutate the original array (don't use `inout`). 

Note that there is already a `swap` function in the standard library. You need to guard it from swapping a location with itself.
****
Better define an inner function to find the next minimum in the array.

*/

func selectionSort(var array: [Int]) -> [Int] {
    guard array.count > 1 else {return array}
    
    func minIndex(array: [Int], startIndex: Int) -> Int {
        var minIndex = startIndex
        for i in startIndex+1..<array.count where array[i] < array[minIndex] {
            minIndex = i
        }
        return minIndex
    }
    
    for i in 0..<array.count {
        let minPos = minIndex(array, startIndex: i)
        if i != minPos {
            swap(&array[i], &array[minPos])
        }
    }

    return array
}


//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.

assert(selectionSort([1]).isSorted())
assert(selectionSort([1, 2, 3]).isSorted())
assert(selectionSort([3, 1, 2]).isSorted())
assert(selectionSort([3, 2, 1, 2, 1]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

