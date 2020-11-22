
import UIKit

class CustomTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    let customTabBarView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -1.0)
        view.layer.shadowOpacity = 0.12
        view.layer.shadowRadius = 10.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        addCustomTabBarView()
        hideTabBarBorder()
        setupTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customTabBarView.frame = tabBar.frame
    }
    
    private func addCustomTabBarView() {
        customTabBarView.frame = tabBar.frame
        view.addSubview(customTabBarView)
        view.clipsToBounds = true
        view.bringSubviewToFront(self.tabBar)
    }
    
    func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
    }
    
    func setupTabBar() {
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .black

        let homeVC = HomeViewController()
        let exploreVC = ExploreViewController()
        let trendsVC = TrendsViewController()
        let insightsVC = InsightsViewController()
        let memberVC = MemberViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bitcoinsign.circle", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), tag: 0)

        exploreVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), tag: 1)

        trendsVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "chart.pie", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), tag: 2)
        
        memberVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.2", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), tag: 3)
        let nav = UINavigationController(rootViewController: exploreVC)
    
        insightsVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "lightbulb", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), tag: 4)
        self.setViewControllers([homeVC, nav, trendsVC,memberVC,insightsVC], animated: false)
        
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height - 1)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(UIColor.selectTabColor.withAlphaComponent(1.0), size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
        self.viewDidLayoutSubviews()
    }
}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
