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
    var h = n
    
    return anyGenerator {
      h = h/2
      return h > 0 ?
        h :
        nil
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
// Knuth's increment sequence h = 3*h+1
class KnuthSequence: SequenceType {
  let n: Int
  
  init(n: Int) {
    self.n = n
  }
  
  func generate() -> AnyGenerator<Int> {
    // find the initial value of h, the biggest one smaller than n
    var h = 1
    while h < n/3 {
      h = 3*h + 1
    }
    return anyGenerator {
      let gap = h
      h = (h - 1)/3
      return gap > 0 ?
        gap :
        nil
    }
  }
}

assert(Array(KnuthSequence(n: 200)) == [121, 40, 13, 4, 1])
assert(Array(KnuthSequence(n: 10)) == [4, 1])

/*:

### 3. Shell sort

Write a shell sort by using one of the generators you created above. Knuth's gap sequence is more performant than Shell's. You may want to read about the performance of other gap sequences.

*/

func shellSort<T>(var array: [T], isOrderedBefore: (T, T) -> Bool) -> [T] {
  guard array.count > 1 else {
    return array
  }
  
  for h in KnuthSequence(n: array.count) {
    for i in h..<array.count {
      let currentItem = array[i]
      var j = i
      while j >= h && isOrderedBefore(currentItem, array[j-h]) {
        array[j] = array[j-h]
        j -= h
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

