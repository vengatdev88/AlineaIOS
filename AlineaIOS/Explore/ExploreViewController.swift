
import UIKit

class ExploreViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.exploreViewController = self
        return mb
    }()
    
    fileprivate func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: "TrendingCollectionViewCell")
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        collectionView.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: "ThemesCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Explore"
        self.tabBarItem.title = nil
        self.view.backgroundColor = .white
        setupMenuBar()
        setupNav()
        setupCollectionView()
    }
    
    private func setupNav() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let leftIcon =  UIImage(systemName: "line.horizontal.3")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let leftBtn = UIBarButtonItem(image:leftIcon, style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBtn
        
        
        let rightIcon =  UIImage(systemName: "bell")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let rightBtn = UIBarButtonItem(image:rightIcon, style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 25).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
    }
    
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 3
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath as IndexPath) as? CategoryCollectionViewCell else { fatalError("Unable to load cell") }
            cell.backgroundColor = .bgColor

            return cell
        } else if indexPath.item == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemesCollectionViewCell", for: indexPath as IndexPath) as? ThemesCollectionViewCell else { fatalError("Unable to load cell") }
            cell.backgroundColor = .bgColor
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCollectionViewCell", for: indexPath as IndexPath) as? TrendingCollectionViewCell else { fatalError("Unable to load cell") }
            cell.backgroundColor = .bgColor
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension UIColor {
    static let bgColor = UIColor(red: 250/255, green: 251/255, blue: 252/255, alpha: 1)
    static let selectTabColor = UIColor(red:76/255, green: 83/255, blue: 200/255, alpha: 1)
    static let stocksColor = UIColor(red: 164/255, green: 166/255, blue: 247/255, alpha: 1)
    static let cryptoColor = UIColor(red: 249/255, green: 215/255, blue: 93/255, alpha: 1)
    static let negativePriceColor = UIColor(red: 236/255, green: 115/255, blue: 112/255, alpha: 1)
    static let positivePriceColor = UIColor(red: 113/255, green: 216/255, blue: 182/255, alpha: 1)
}
  
