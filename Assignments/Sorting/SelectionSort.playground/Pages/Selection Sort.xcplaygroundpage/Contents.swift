/*:

### 1. The Algorithm
Write a `selectionSort` function that takes an integer array and returns it as sorted in ascending order. Don't mutate the original array (don't use `inout`). 

Note that there is already a `swap` function in the standard library. You need to guard it from swapping a location with itself.
****
Better define an inner function to find the next minimum in the array.

*/

func selectionSort(var array: [Int]) -> [Int] {
    guard array.count >= 2 else {
        return array
    }
    
    var startIndex = array.startIndex
    
    while startIndex != array.endIndex {
        var lowestIndex = array.startIndex
        var lowestValue = Int.max
        for index in startIndex..<array.endIndex {
            let value = array[index]
            if value < lowestValue {
                lowestValue = value
                lowestIndex = index
            }
        }
        
        if lowestIndex != startIndex {
            swap(&array[lowestIndex], &array[startIndex])
        }
        
        startIndex = startIndex.advancedBy(1)
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

