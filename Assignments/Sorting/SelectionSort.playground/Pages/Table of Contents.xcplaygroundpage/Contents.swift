/*:

## Selection Sort
When you ask someone to sort a deck of cards in ascending order by hand, you will see that the common intuition will be like "Select the minimum card and put it in the first place. Select the second minimum and put it in the second place. And so on". This is called selection sort. Here is [a brief explanation](http://www.sorting-algorithms.com/selection-sort)

- [Selection Sort](Selection%20Sort)
- [Generic](Generic)
- [Pass a Closure](Pass%20a%20Closure)
- [SequenceType Extension](SequenceType%20Extension)

****
[Start with the first step](@next)
*/
//
// Part 1
//

func selectionSort(originalArray: [Int]) -> [Int] {
    
    var newArray = originalArray
    var startingIndex = 0
    var otherIndex = 1
    var arrayLength = newArray.count
    
    repeat {
        repeat {
            if newArray[startingIndex] > newArray[otherIndex] {
                swap(&newArray[startingIndex], &newArray[otherIndex])
                startingIndex = 0
                otherIndex = 1
            } else {
                otherIndex++
            }
        } while otherIndex < (arrayLength - 1)
        
        startingIndex++
        otherIndex = startingIndex + 1
        
    } while startingIndex < arrayLength - 1
    
    return newArray
}

//
// Part 2
//

func selectionSort<T: Comparable>(originalArray: [T]) -> [T] {
    
    var newArray = originalArray
    var startingIndex = 0
    var otherIndex = 1
    var arrayLength = newArray.count
    
    repeat {
        repeat {
            if newArray[startingIndex] > newArray[otherIndex] {
                swap(&newArray[startingIndex], &newArray[otherIndex])
                startingIndex = 0
                otherIndex = 1
            } else {
                otherIndex++
            }
        } while otherIndex < (arrayLength - 1)
        
        startingIndex++
        otherIndex = startingIndex + 1
        
    } while startingIndex < arrayLength - 1
    
    return newArray
}


//
// Part 3
//


func selectionSort<T>(originalArray: [T], @noescape isOrderedBefore: (firstElement: T, secondElement: T) -> Bool) -> [T] {
    
    var newArray = originalArray
    var startingIndex = 0
    var otherIndex = 1
    var arrayLength = newArray.count
    
    repeat {
        repeat {
            if isOrderedBefore(firstElement: newArray[startingIndex], secondElement: newArray[otherIndex]) {
                swap(&newArray[startingIndex], &newArray[otherIndex])
                startingIndex = 0
                otherIndex = 1
            } else {
                otherIndex++
            }
        } while otherIndex < (arrayLength - 1)
        
        startingIndex++
        otherIndex = startingIndex + 1
        
    } while startingIndex < arrayLength - 1
    
    return newArray
}

//
// Part 4
//

extension SequenceType {
    func selectionSort(isOrderedBefore: (Generator.Element, Generator.Element) -> Bool) -> [Generator.Element] {
        
        var newArray = Array<Generator.Element>(self)
        var startingIndex = 0
        var otherIndex = 1
        var arrayLength = newArray.count
        
        repeat {
            repeat {
                if isOrderedBefore(newArray[startingIndex], newArray[otherIndex]) {
                    swap(&newArray[startingIndex], &newArray[otherIndex])
                    startingIndex = 0
                    otherIndex = 1
                } else {
                    otherIndex++
                }
            } while otherIndex < (arrayLength - 1)
            
            startingIndex++
            otherIndex = startingIndex + 1
            
        } while startingIndex < arrayLength - 1
        
        return newArray
    }
}










