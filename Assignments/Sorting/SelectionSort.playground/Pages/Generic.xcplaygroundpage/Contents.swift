/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/
func selectionSort<T: Comparable>(toSort: [T]) -> [T]{

    let numberOfElements = toSort.count

    var sortedArray = toSort

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


assert(selectionSort(["c", "a", "b"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

