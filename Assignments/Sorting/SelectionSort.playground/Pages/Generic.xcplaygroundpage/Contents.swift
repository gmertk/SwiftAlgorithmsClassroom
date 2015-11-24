/*:

### 2. Make it Generic

Turn the function into a generic function so that it can sort any type of array. Only constraint is that elements of the array should conform to the `Comparable` protocol.
****
For practicing purposes you may want to rewrite the function from scratch rather than just copy-pasting.
*/


func selectionSort<X:Comparable>(array:[X]) -> [X] {
    var index = 0
    var anArray = array
    while(!anArray.isSorted()) {
        let subArray = Array(anArray[index..<anArray.count])
        let minIndex = indexOfMin(subArray)
        if index+minIndex < anArray.count && minIndex != 0 {
            swap(&anArray[index], &anArray[index+minIndex])
        }
        index++
    }
    return anArray
}

func indexOfMin<X:Comparable>(array:[X]) ->Int {
    var indexOfMin = 0
    for (index,value) in array.enumerate() {
        if value < array[indexOfMin] {
            indexOfMin = index
        }
    }
    return indexOfMin
}


assert(selectionSort(["c", "a", "b"]).isSorted())

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

