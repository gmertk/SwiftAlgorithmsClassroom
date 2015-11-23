/*:

### 1. The Algorithm
Write a `selectionSort` function that takes an integer array and returns it as sorted in ascending order. Don't mutate the original array (don't use `inout`). 

Note that there is already a `swap` function in the standard library. You need to guard it from swapping a location with itself.
****
Better define an inner function to find the next minimum in the array.

*/

func selectionSort(array: [Int]) -> [Int] {
    
    let numberOfElements = array.count
    
    var sortedArray = array
    
    for i in 0..<numberOfElements-1 {
        
        var minIndex = i
        
        for j in i+1..<numberOfElements {
            if sortedArray[j] < sortedArray[minIndex] {
                minIndex = j
            }
        }
        
        if(minIndex != i){
            swap(&sortedArray[i], &sortedArray[minIndex])
        }
        
    }
    
    
    return sortedArray
}


//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.

assert(selectionSort([1]).isSorted())
assert(selectionSort([1, 2, 3]).isSorted())
assert(selectionSort([3, 1, 2]).isSorted())
assert(selectionSort([3, 2, 1, 2, 1]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

