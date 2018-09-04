class UIApplication
  def self.root
    sharedApplication.keyWindow.rootViewController.viewControllers.first
  end
end
