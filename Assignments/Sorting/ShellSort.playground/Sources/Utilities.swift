import Foundation

public extension SequenceType {
    func isSorted(@noescape isOrderedBefore: (Generator.Element, Generator.Element) -> Bool ) -> Bool {
        var prev: Generator.Element?
        for element in self {
            if let prev = prev {
                if !isOrderedBefore(prev, element) {
                    return false
                }
            }
            prev = element
        }
        
        return true
    }
}

public extension SequenceType where Generator.Element: Comparable {
    func isSorted() -> Bool {
        return isSorted(<=)
    }
}