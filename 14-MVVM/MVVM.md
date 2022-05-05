## MVVM

### ViewModel
- Owns the model
- Does not own a View or a ViewController
- Completely UI-independent (aka should not import UIKit)
- When the model changes, viewModel will trigger a closure (potentially updating a view)
- Controller sets up the View binding for the ViewModel (via closure, or observables pattern)

### Easier Testing
- Testing a VC is difficult: lifecycle methods, autolayout, coupled with UI
- Testing a VM is easier: no UI, only deals with data related logic


### Dependency Injection with VM
- Ex. ViewModel with a networking service object
- Production networking object can be replaced with mock networking object

