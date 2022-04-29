## TableView
- Scrollable view with rows of `cells` that display information
- Gets data from a `DataSource` and provide that data to `cells` to be displayed
- `cells` are re-used so that a tableView with 1000 cells will only create the first ~10 cells and re-use them

### UITableView
1. Set up a dataSource
2. register cells with identifier

### UITableViewDataSource
1. numberOfRows in section (and number of sections if multiple sections)
2. cellForRowAt
- tableView.dequeueReusableCell

### UITableViewDelegate
1. didSelectRowAt
2. heightForRowAt
 
 
