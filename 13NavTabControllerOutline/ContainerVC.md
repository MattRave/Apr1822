## Container View Controller

### TabBar Controller
- holds multiple tabs that shows other UIViewController on each tab
- can access its .viewControllers: [UIViewController]
- can access the .selectedIndex: Int and .selectedViewController
- UITabBarControllerDelegate: .didSelect viewController
    
### Navigation Controller
- holds a stack of viewControllers
- can add nav bar buttons with leftBarButtonItem / rightBarButtonItem / backBarButtonItem
- display the viewController's title property in the middle
- `.viewControllers` -> [UIViewController]
- `.topViewController`
- can push a new viewController on the stack with `.pushViewController`
- `.popViewController`
- `.popToRootViewController`
- 
