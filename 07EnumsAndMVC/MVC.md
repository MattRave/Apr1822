## What is a Design Pattern?
1) Consistent way of solving a problem
- Example: Singleton, Builder, Adapter
2) "Architecture-Design Pattern": 
- solving the problem of communication between the data source and the view

## MVC: Model, View, Controller

### Model: Data
1) Holds a representation of the data
2) Data Calculations / Business Logic
3) Completely UI - independent 

### View: Visual rendering, communicates with Controller, register user’s interaction
1) Users Input
    - TapGesture, Buttons, Swipes
2) Showing Data
    - Not the source of data / reflect the data given to it
3) Communication 
    - From Controller to View: Controller owns the view as a property, direct reference
    - From View to Controller: IBActions and delegation pattern. A view not own a reference to the controller
 
### Controller: Communication between View - Model
1) Fetching Data: Networking / Database
2) Formating Data: Formats the data for user to consume
3) Handling User events
4) Navigation (Routing)
5) Responding to model events and view events
6) Communication
    a. From Controller to View: talks directly to the view (controller owns the view)
    b. From Controller to Model: controller owns the model
    c. From View to Controller: IBActions and delegation pattern
    d. From Model to Controller: 
        - Observers (property observer)
        - Publisher/Subscriber pattern, (Notification)
        - Closures
        - Delegation
