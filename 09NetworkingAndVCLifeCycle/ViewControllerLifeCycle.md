## ViewController Life Cycle
- These methods are called automatically by the system when a viewController is presented/transitioning

1) viewDidLoad()
2) viewWillAppear()
3) viewWillLayoutSubviews()
4) viewDidLayoutSubviews()
5) viewDidAppear()
6) viewWillDisappear()
7) viewDidDisappear()

### Less used methods:
loadView() -> programmatically set up subViews of VC
loadViewIfNeeded() -> load view if it is not set up
viewWillTransition(to size:) -> device rotating
willMove(toParent) -> adding a child VC
didMove(toParent) -> adding a child VC
didReceiveMemoryWarning() -> system needs to clear memory
