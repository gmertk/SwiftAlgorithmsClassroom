/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/
func selectionSort<T: Comparable>(var array: [T]) -> [T] {
  // You may declare array argument with var keyword so that it is copied.
    var minIndex:Int
    let length = array.count
    
    for i in 0..<length-1 {
        minIndex = i
        for j in i+1..<length {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if(minIndex != i){
            swap(&array[minIndex], &array[i])
        }
    }
    return array
}



assert(selectionSort([1, 4, 2]).isSorted())
assert(selectionSort(["c", "a", "b"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

