
import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    let tableView = UITableView()
    let trendsTitle = [["Medifast","Pintrest","Slack Technologies","Evoqua Water"],["Slack Technologies","Evoqua Water"]]
    let trendsSubTitle = [["Medi","Pins","work","Aqua"],["work","Aqua"]]
    let trendPrices = [[50.78,-4.77,-5.99,5.99],[-5.99,5.99]]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        tableView.register(TrendTableViewCell.self, forCellReuseIdentifier: "TrendTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.contentInset =  UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor , constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
}


extension TrendingCollectionViewCell : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 4 : 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = section == 0 ? "Top Gainers" : "Top Sellers"
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor , constant:20).isActive = true
        label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 0).isActive = true
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendTableViewCell", for: indexPath) as? TrendTableViewCell else { fatalError("Unable to load") }
        
        cell.trendTitleLabel.text = trendsTitle[indexPath.section][indexPath.row]
        cell.trendSubtitleLabel.text = trendsSubTitle[indexPath.section][indexPath.row]
        let tuple = string(fromPrice:trendPrices[indexPath.section][indexPath.row])
        cell.trendPriceLabel.text = tuple.text
        cell.trendPriceLabel.backgroundColor = tuple.bgColor

        if (indexPath.section == 1 && indexPath.row == 1)  || (indexPath.section == 0 && indexPath.row == 3) {
            cell.separatorInset = UIEdgeInsets(top: 0, left: CGFloat.greatestFiniteMagnitude, bottom: 0, right: 0)
        }
        return cell
    }
    
    private func string(fromPrice price: Double) -> (text:String,bgColor:UIColor) {
        let color =  price < 0 ? UIColor.negativePriceColor : UIColor.positivePriceColor
        let str = price < 0 ? "\(price) %" : "+\(price) %"
        return (str,color)
    }
}

