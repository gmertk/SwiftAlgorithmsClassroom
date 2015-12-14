import Foundation

/*:

### 1. Shell's Gap Sequence

Read about [GeneratorType](http://swiftdoc.org/v2.1/protocol/GeneratorType/ ), [AnyGenerator](http://swiftdoc.org/v2.1/type/AnyGenerator/ ), [anyGenerator](http://swiftdoc.org/v2.1/func/anyGenerator/ ). Complete the given ShellSequence class to generate a Shell sequence going like ⌊n/2⌋, ⌊n/4⌋, ..., 1. The generator should return nil when the value is less than 1.

*/

class ShellSequence: SequenceType {
    let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func generate() -> AnyGenerator<Int> {
        var m = n
        
        return anyGenerator {
            m = m/2
            return m >= 1 ? m : nil
        }
    }
}

//: Test your code with assert. Make sure asserts don't raise any errors.

assert(Array(ShellSequence(n: 20)) == [10, 5, 2, 1])
assert(Array(ShellSequence(n: 9)) == [4, 2, 1])
assert(Array(ShellSequence(n: 2)) == [1])
assert(Array(ShellSequence(n: 1)) == [])


/*:

### 2. Knuth's Gap Sequence

Write a similar class to create a gap sequence of (3 ^ k  - 1) / 2) going as 1, 4, 13, 40, ... We will use the elements less than n in reversed order. For example if n is 200, the sequence should be [121, 40, 13, 4, 1].

*/

class KnuthSequence: SequenceType {
    let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func generate() -> AnyGenerator<Int> {
        var gaps = [Int]()
        for i in 1...n/3 {
            let x = (Int(pow(3.0, Double(i))) - 1) / 2
            guard x < n else { break }
            gaps.append(x)
        }
        
        gaps.sortInPlace(>)
        var g = gaps.generate()
        
        return anyGenerator {
            return g.next()
        }
    }
}

assert(Array(KnuthSequence(n: 200)) == [121, 40, 13, 4, 1])
assert(Array(KnuthSequence(n: 10)) == [4, 1])
assert(Array(KnuthSequence(n: 4)) == [1])

/*:

### 3. Shell sort

Write a shell sort by using one of the generators you created above. Knuth's gap sequence is more performant than Shell's. You may want to read about the performance of other gap sequences.

*/

func shellSort<T>(var array: [T], isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    for gap in KnuthSequence(n: array.count) {
        print("gap \(gap)")
        
        // Create a sub array of this gap's items
        var subArray = [T]()
        for i in 0.stride(to: array.count, by: gap) {
            subArray.append(array[i])
        }
        
        // Sort that sub array using insertion sort
        for i in 1..<subArray.count {
            let currentItem = subArray[i]
            var j = i
            while j > 0 && isOrderedBefore(currentItem, subArray[j-1]) {
                subArray[j] = subArray[j-1]
                j--
            }
            subArray[j] = currentItem
        }
        
        // Update the original array with the sorted subArray's values
        var g = subArray.generate()
        for i in 0.stride(to: array.count, by: gap) {
            array[i] = g.next()!
        }
        
    }
    
    return array
}

let items = ["c", "d", "b", "a"]
let sortedItems = shellSort(items, isOrderedBefore: <)
assert(sortedItems.isSorted())
assert(items == ["c", "d", "b", "a"]) // double check that items does not change
let charArray = Array("A whole lot of text to sort so we get more than a few gaps. Also: Lorem Ipsum, or something.".characters)
charArray.count
let sortedCharArray = shellSort(charArray, isOrderedBefore: <)
assert(sortedCharArray.isSorted())
assert(sortedCharArray.count == charArray.count)

assert(shellSort([Int](), isOrderedBefore: <).isSorted())
assert(shellSort([1], isOrderedBefore: <).isSorted())
assert(shellSort([1, 2, 3], isOrderedBefore: <).isSorted())
assert(shellSort([1, 2, 3], isOrderedBefore: >).isSorted(>))
assert(shellSort([3, 0, 2, 1, 2, -1], isOrderedBefore: <).isSorted())
assert(shellSort([3, 10, 23, 25, 1235, 234, 980, -3245, 0, 10, 89, 2, 200, 1, 100298, 2, 253, -983, 1039, -1], isOrderedBefore: <).isSorted())



/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

