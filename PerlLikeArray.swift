extension Array {
    typealias Element = T
    
    mutating func scalar() -> Int { // use it if you like perl
        return Int(self.count)
    }
    
    mutating func pop() -> T? {
        return self.isEmpty ? nil : self.removeAtIndex(self.endIndex.predecessor())
    }
    
    mutating func push(newElements: T...) -> [T] {
        self.splice(newElements, atIndex: self.endIndex)
        return self
    }
    
    mutating func shift() -> T? {
        return self.isEmpty ? nil : self.removeAtIndex(self.startIndex)
    }
    
    mutating func unshift(elements: T...) -> [T] {
        self.splice(elements, atIndex: self.startIndex)
        return self
    }
    
    mutating func splice(var _ atIndex :Int = 0, _ length :Int = 0, _ newElements: T...) -> Slice<T>? {
        description
        var theIndex = length + atIndex
        var spliced :Slice<T> = []
        if length < 0 {fatalError("minus length was set")}
        if atIndex >= 0 {
            if theIndex > self.endIndex {fatalError("Bad Access")}
            let preArray = atIndex > 0 ? self[self.startIndex..<atIndex] : []
            spliced = length > 0 ? self[atIndex..<theIndex] : []
            let postArray = self[theIndex..<self.endIndex]
            self = preArray + Array(newElements) + postArray
            return length > 0 ? Slice(spliced) : nil
        } else {    // you can use minus atIndex because it is like Perl
            let reversed = self.reverse()
            atIndex = abs(atIndex + 1)
            theIndex = length + atIndex
            if theIndex > self.endIndex {fatalError("Bad Access")}
            let postArray = atIndex > 0 ? reversed[reversed.startIndex..<atIndex].reverse() : []
            spliced = length > 0 ? reversed[atIndex..<theIndex].reverse() : []
            let preArray =   theIndex < reversed.endIndex ? reversed[theIndex..<reversed.endIndex].reverse() :[]
            self = preArray + Array(newElements) + postArray
            return length > 0 ? Slice(spliced) : nil
        }
    }
}
