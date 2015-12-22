/*:

## 2. Functional quicksort

This is a rather inefficient but neat solution. Pick a pivot and remove it from the array. Then use `filter` to create two arrays: one containing smaller items than the pivot, other one containing the rest. Then call the function on these arrays, and append them to each other with the pivot in the middle.

*/

func swiftyQuickSort<T>(var array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else {
        return array
    }

    return array
}

//let array1 = [1]
//assert(swiftyQuickSort(array1, <) == [1])
//
//let array2 = [Int]()
//assert(swiftyQuickSort(array2, <) == [])
//
//let array3 = ["c", "d", "b", "a"]
//assert(swiftyQuickSort(array3, <) == ["a", "b", "c", "d"])
//
//let array4 = [3, 0, 2, 1, 2, -1]
//assert(swiftyQuickSort(array4, <) == [-1, 0, 1, 2, 2, 3])
//
//let array6 = [5, 1, 2, 3]
//assert(swiftyQuickSort(array6, >) == [5, 3, 2, 1])
/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
