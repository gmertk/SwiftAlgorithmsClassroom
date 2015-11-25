/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/
func selectionSort<T : Comparable>(var array: [T]) -> [T] {
    // You may declare array argument with var keyword so that it is copied.
    
    var min: Int
    
    for var i = 0; i < array.count-1; ++i {
        min = i
        for var j=i+1; j < array.count; ++j{
            if array[j] < array[min]{
                min = j
            }
        }
        
        if min != i{
            swap(&array[min], &array[i])
        }
    }
    
    return array
}




assert(selectionSort(["c", "a", "b"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

