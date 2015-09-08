class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = SwipeViewController.alloc.init
    rootViewController.title = 'SimpleDemo'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = rootViewController
    @window.makeKeyAndVisible

    true
  end
end
