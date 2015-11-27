/*:

### 1. The Algorithm
Write a `selectionSort` function that takes an integer array and returns it as sorted in ascending order. Don't mutate the original array (don't use `inout`). 

Note that there is already a `swap` function in the standard library. You need to guard it from swapping a location with itself.
****
Better define an inner function to find the next minimum in the array. I think it makes the algorithm easier to grasp. If you think it is useless, you can omit the inner function and write it as an inner loop. Note that this function call could make it less performant depending on the compiler's optimization.
*/

func selectionSort(var array: [Int]) -> [Int] {
    func minPosition(array: [Int], start: Int) -> Int {
        var minPos = start
        for i in start..<array.count where array[i] < array[minPos] {
            minPos = i
        }
        return minPos
    }

    for i in 0..<array.count {
        let minIndex = minPosition(array, start: i)
        if i != minIndex {
            swap(&array[i], &array[minIndex])
        }
    }

    return array
}

//: Test your function with assert. Make sure asserts don't raise any errors. `isSorted` is already defined for you in `Sources/Utilities.swift`. You can add more test cases.

let items = [3, 1, 4, 1, 5, 9]
let sortedItems = selectionSort(items)
assert(sortedItems.isSorted())
// double check that items does not change
assert(items == [3, 1, 4, 1, 5, 9])
assert(selectionSort([1]).isSorted())
assert(selectionSort([1, 2, 3]).isSorted())
assert(selectionSort([3, 1, 2]).isSorted())
assert(selectionSort([3, 2, 1, 2, 1]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

