/*:

### 1. The Algorithm
Write a `selectionSort` function that takes an integer array and returns it as sorted in ascending order. Don't mutate the original array (don't use `inout`). 

Note that there is already a `swap` function in the standard library. You need to guard it from swapping a location with itself.
****
Better define an inner function to find the next minimum in the array.

*/

func selectionSort(array: [Int]) -> [Int] {
    // You may declare array argument with var keyword so that it is copied.
    var anArray = array
    var index = 0
    while (!anArray.isSorted()) {
        let subArray = Array(anArray[index..<anArray.count])
        let minIndex = minimumIndexInArray(subArray)
        if ((index+minIndex) < anArray.count && minIndex != 0) {
            swap(&anArray[index], &anArray[index+minIndex])
        }
        index++
    }
    
    return anArray
}

func minimumIndexInArray(array : [Int]) -> Int {
    var minPosition = 0
    for (index,value) in array.enumerate() {
        if value<=array[minPosition] {
            minPosition = index
        }
    }
    return minPosition
}
//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.
selectionSort([3, 2, 1, 2, 1])
assert(selectionSort([1]).isSorted())
assert(selectionSort([1, 2, 3]).isSorted())
assert(selectionSort([3, 1, 2]).isSorted())
assert(selectionSort([3, 2, 1, 2, 1]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

