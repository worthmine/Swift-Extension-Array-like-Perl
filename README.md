# Swift-Extension-Array-like-Perl
Array operations with Perl-Like grammar in Swift

##Use like bellow

```
var a :Array = ["Four", "Seven"]
a.splice(["Five", "Six"], atIndex: 1)   // using a default splice
a.splice(2, 0, "Five2" )                // -> nil   //use splice with no adding. it returns nil but sucsesses to splice
a.splice(2, 2, "Six3")                  // -> {["Five2", "Six"]}  // using mutating splice
a.splice(-2, 1, "Six4" )                // -> {["Six3"]}  // use a added splice

a                                       // -> ["Four", "Five", "Six4", "Seven2", "Eight"]
a.splice(0, a.count, "other", "Strings", "like", "those")
a                                       // -> ["other", "Strings", "like", "those"]
a.splice(-2, 2)                         // -> ["Strings", "like"]

a = ["Four", "Five", "Six", "Seven"]
a.unshift("Two", "Three")               // insert an array to the top of this Array
a.unshift("One")[0...0]                 // add a value to the top of this Array
a.count                                 // -> 8
a.push("Eight", "Nine")                 // add an array to the bottom of this Array
a.push("Ten")                           // add a value to the bottom of this Array
a[2]                                    // -> "Three"
a[2...3]                                // -> ["Three", "Four"]
a                                       // -> ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
a.count                                 // -> 10
a.shift()                               // remove one value from the top of this Array
a.pop()                                 // remove one value from the bottom of this Array
a.count                                 // -> 8
```
## for Int

```
var b :Array = [4, 7, 8 ]       // -> [4,7,8]
b.count                         // -> 3
b.splice([5, 6], atIndex: 1)    // -> [4,5,6,7,8]
b.unshift(2, 3)[0...0]          // -> [2]
var unshifted = b.unshift(1)    // -> [1,2,3,4,5,6,7,8]
unshifted.unshift(0)            // -> [0,1,2,3,4,5,6,7,8]
b                               // -> [1,2,3,4,5,6,7,8]
b.push(9, 10)[1...3]            // -> [2,3,4]
b.push(11)[b.startIndex]        // -> 1
b[2]                            // -> 3
b.shift()                       // -> {Some 1}  // because the Type has been never defined
var shifted = b.shift() as Int? // -> {Some 2} // it must be bad at grammar because pop and shift may return nil
b.splice(0, b.count-2)          // splice 7 elements with no adding. wow it's the very Perl-like!
var popped :Int! =  b.pop()?    // -> 11    // it will be a better way
popped =  b.pop() as Int?       // -> 10    // how to down cast
b.isEmpty                       // -> true
popped =  b.pop() as Int?       // -> nil   //pop and shift will return nil if there is no value
```
