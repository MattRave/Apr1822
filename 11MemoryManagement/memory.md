## Memory Management

### ARC: for reference types only
reference count increase for each new variable refering to the object
when reference count is 0, memory is released
references are strong by default (meaning it increases ref count)

### Weak and Unowned
Both weak and unwoned do not increase the reference count
use to fix memory leaks
weak has to be optional
unowned does not have to be optional, can crash if accessed when nil

### Capture list
defines how the references are captured by a closure
let closure = `{ [weak self] in }`
