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
        var i = n
        return anyGenerator {
            i = i/2
            return i > 0 ? i : nil
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
        var i:Int = 1 
        while i <= n/3 {
            i = i*3 + 1
        }
        
        return anyGenerator {
            let gap = i
            i = (i-1)/3
            return gap > 0 ? gap : nil
        }
    }
}

assert(Array(KnuthSequence(n: 200)) == [121, 40, 13, 4, 1])
assert(Array(KnuthSequence(n: 9)) == [4, 1])

/*:

### 3. Shell sort

Write a shell sort by using one of the generators you created above. Knuth's gap sequence is more performant than Shell's. You may want to read about the performance of other gap sequences.

*/

func shellSort<T>(var array: [T], isOrderedBefore: (T, T) -> Bool) -> [T] {
    
    guard array.count > 1 else {
        return array
    }
   
    for gap in KnuthSequence(n: array.count) {
        for i in 1..<array.count {
            let currentItem = array[i]
            var j = i
            while j >= gap && isOrderedBefore(currentItem, array[j-gap]) {
                array[j] = array[j-gap]
                j = j-gap
            }
            array[j] = currentItem
        }
    }
    
    return array
}

let items = ["c", "d", "b", "a"]
let sortedItems = shellSort(items, isOrderedBefore: <)
assert(sortedItems.isSorted())
assert(items == ["c", "d", "b", "a"]) // double check that items does not change

assert(shellSort([Int](), isOrderedBefore: <).isSorted())
assert(shellSort([1], isOrderedBefore: <).isSorted())
assert(shellSort([1, 2, 3], isOrderedBefore: <).isSorted())
assert(shellSort([1, 2, 3], isOrderedBefore: >).isSorted(>))
assert(shellSort([3, 0, 2, 1, 2, -1], isOrderedBefore: <).isSorted())



/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

