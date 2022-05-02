## Memory Management

### ARC: for reference types only
- Reference count increase for each new variable refering to the object
- When reference count is 0, memory is released
- References are strong by default (meaning it increases ref count)

### Weak and Unowned
- Both weak and unwoned do not increase the reference count
- Used to fix memory leaks
- Weak has to be optional
- Unowned does not have to be optional, can crash if accessed when nil

### Capture list
- Defines how the references are captured by a closure
- let closure = `{ [weak self] in }`
